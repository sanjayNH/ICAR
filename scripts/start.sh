# create docker network for our environment if it does not exist
docker network create icar-network
# start up mysql and dynamodb local containers defined in docker-compose.yml
docker-compose up -d
docker-compose exec mysql sh -c 'exec mysqldump  -uroot -p"icarpassword" mysql' < ./db/icar3.sql
# load current db schema and data dump
docker exec -i  08abdc3d3154 mysql -uroot -picarpassword < db/icar3.sql
# start up serverless application model (SAM) api
# -d is the port for node debugging
# --docker-network attaches the SAM docker container to the same network as the mysql and dynamodb containers
cd src
if [[ "$@" == "debug" ]]; then 
    sam local start-api -d 5858 --docker-network icar-network
else
    sam local start-api --docker-network icar-network
fi