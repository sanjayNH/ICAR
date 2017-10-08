'use strict';
var AWS = require('aws-sdk');
var ddb = new AWS.DynamoDB();

var connectionString;

// example of getting config values from DynamoDB
function loadConfig(context, callback) {

    
    var functionName = context.functionName;
    var functionArn = context.invokedFunctionArn;
    var alias = functionArn.split(":").pop();

    //the ARN doesn't include an alias token, therefore we must be executing $LATEST
    if (alias == functionName)
        alias = "$LATEST";

    //the code is running on a local devs maching in SAM Local
    if (process.env.AWS_SAM_LOCAL == "true")
    {
        alias = "samlocal";
        ddb.endpoint = new AWS.Endpoint('http://dynamodb:8000');
    }
        

    var obj_key = alias;
    console.log('DDB key:[' + obj_key + ']')

    var params = {
        Key: {
            key_stage: {
                S: obj_key
            },
            key_option: {
                S: "db"
            }
        },
        TableName: "icar-config",
        AttributesToGet: ['connectionString']
    }

    ddb.getItem(params, function (err, data) {
        if (err) {
            console.log(err);
            var message = "Error getting object from DynamoDB"
            console.log(message)
            context.fail(message)
        } else {
            callback(data)
        }
    });
}

// example of handling Gateway API Events
function handleRequest(event, callback) {
    // get id from path param recieved from AWS API Gateway
    console.log(event.pathParameters);
    var id;
    if(event.pathParameters != null)
        id = event.pathParameters.product || false;
        
    switch (event.httpMethod) {
        case "GET":

            if (id) {
                callback(null, { statusCode: 200, headers: { "content-type": "text/plain" }, body: "This is a READ operation on product ID " + id });
                return;
            }

            callback(null, { statusCode: 200, headers: { "content-type": "text/plain" }, body: "This is a LIST operation, return all products" });
            break;

        case "POST":
            callback(null, { statusCode: 200, headers: { "content-type": "text/plain" }, body: "This is a CREATE operation" });
            break;

        case "PUT":
            callback(null, { statusCode: 200, headers: { "content-type": "text/plain" }, body: "This is an UPDATE operation on product ID " + id });
            break;

        case "DELETE":
            callback(null, { statusCode: 200, headers: { "content-type": "text/plain" }, body: "This is a DELETE operation on product ID " + id });
            break;

        default:
            // Send HTTP 501: Not Implemented
            console.log("Error: unsupported HTTP method (" + event.httpMethod + ")");
            callback(null, { statusCode: 501 })

    }
}

function loadConfigCallback(env_config, lambdaCallback){
    console.log('My db connectionString:', env_config.Item.connectionString.S)
    //do something with config values...
    handleRequest(event, callback);
}


exports.handler = (event, context, callback) => {
    
  //  handleRequest(event, callback);
    
     // load the config, then use in handle request 
     loadConfig(context, function (env_config) {
        console.log('My db connectionString:', env_config.Item.connectionString.S)
        //do something with config values...
        handleRequest(event, callback);
    });
}