# create isolated network for icar dev environment
$network = docker network list | select-string 'icar-network'
if($network -like '*icar-network*') {
    echo "icar-network exists already"
}
else {
    echo "icar-network does not exist, creating"
    docker network create icar-network
}
 
# start up mysql and dynamodb local containers defined in docker-compose.yml (if not already from provision.sh)
docker-compose up -d

# create dynamodb table and sample data
$table = aws dynamodb --endpoint-url http://localhost:8000 list-tables
if($table -like '*icar-config*'){
    echo "dynamodb table exists, skipping create/import"
}
else {
    # create dynamodb table
    echo "dynamodb table does not exist, creating"
    aws dynamodb --endpoint-url http://localhost:8000 create-table --cli-input-json file://db/icarConfigTable.json
    

    # import config data if found
    aws dynamodb put-item --endpoint-url http://localhost:8000  --table-name icar-config --item file://db/icarConfig.json 
}

# wait for mysql to spin up in local docker continer before creating schema and importing data
while ( -Not (docker exec -i icar_mysql_1 mysqladmin -uroot  ping --silent))
{
    echo "Waiting for database connection..."
    sleep 1
}
echo "mysql is ready"

# create icar3 database schema and load sample data
$mysql = docker exec -i  icar_mysql_1 mysql -uroot  -e "show databases;"

if($mysql -like '*icar3*'){
    echo "dynamodb exists, skipping create/import"
}
else {
    echo "mysql db does not exist, create latest schema"
    # load mysql schema
    sleep 10 # wait for mysql to fully load
    Get-Content db/icar3.sql | docker exec -i  icar_mysql_1 mysql -uroot
}


# start up serverless application model (SAM) api
# -d is the port for node debugging
# --docker-network attaches the SAM docker container to the same network as the mysql and dynamodb containers
if($args[0] -eq "debug"){
    sam local start-api -d 5858 --docker-network icar-network
}
else {
    sam local start-api --docker-network icar-network
}
