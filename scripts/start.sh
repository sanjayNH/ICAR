# create isolated network for icar dev
docker network list | grep 'icar-network' &> /dev/null
if [ $? == 1 ]; then
    echo "icar-network does not exist, create"
    docker network create icar-network
else
    echo "icar-network exists, skipping create"
fi

# start up mysql and dynamodb local containers defined in docker-compose.yml 
docker-compose up -d


# check if icar-config table exists, if not create
aws dynamodb --endpoint-url http://localhost:8000 list-tables  | grep 'icar-config' &> /dev/null
if [ $? == 1 ]; then
   echo "dynamo table does not exists, create"
    # create icar-config dynamodb table
      aws dynamodb --endpoint-url http://localhost:8000 create-table --cli-input-json file://db/icarConfigTable.json
    
    #import config settings for dynamodb local (must get from dev lead and place in db folder)   
    aws dynamodb put-item --endpoint-url http://localhost:8000  --table-name icar-config --item file://db/icarConfig.json 
else
    echo "dynamo table exists, skipping create"
fi


while ! docker exec -i icar_mysql_1 mysqladmin -uroot  ping --silent; do
    echo "Waiting for database connection..."
    sleep 10
done


docker exec -i  icar_mysql_1 mysql -uroot  -e "show databases;" | grep "icar3" &> /dev/null
if [ $? == 1 ]; then
    echo "mysql db does not exist, create and import latest schema"
    # load mysql schema
    sleep 10 # wait for mysql to fully load
    docker exec -i  icar_mysql_1 mysql -uroot  < db/icar3.sql
else
    echo "mysql db exists, skipping create"
fi

# # start up serverless application model (SAM) api
# # -d is the port for node debugging
# # --docker-network attaches the SAM docker container to the same network as the mysql and dynamodb containers
if [[ "$@" == "debug" ]]; then 
    sam local start-api -d 5858 --docker-network icar-network
else
    sam local start-api --docker-network icar-network
fi
