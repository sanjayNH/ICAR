

module.exports.loadConfig = function (context, callback){
    
        functionName = context.functionName
        functionArn = context.invokedFunctionArn
        alias = functionArn.split(":").pop()
    
        //the ARN doesn't include an alias token, therefore we must be executing $LATEST
        if (alias == functionName)
            alias = "$LATEST"
    
        obj_key = alias
        console.log('DDB key:['+obj_key+']')
    
        var params = {
                Key:{
                      store:{
                          S: obj_key	
                      },
                      options:{
                          S: 
                      }

                },
                TableName:ddbtable,
                AttributesToGet: ['s3bucket','snstopic']
            }
    
        ddb.getItem(params, function(err, data) {
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







exports = {
    database: {
        connectionString: getConfigOption("db")
    },
    environment: (context) => {
       return getEnvironment(context)
    }
};


function getEnvironment(context) {
    if(process.env.AWS_SAM_LOCAL == "true"){
        return "samlocal";
    }
    return context.invokedFunctionArn;
};

function getConfigOption(context, option){    
    var table = "icar-config";
    var store = "samlocal";
    var option = "db";

    var params = {
        TableName: table,
        Key:{
            "store": store,
            "option": option
        }
    };

    docClient.get(params, function(err, data) {
        if (err) {
            console.error("Unable to read item. Error JSON:", JSON.stringify(err, null, 2));
        } else {
            console.log("GetItem succeeded:", JSON.stringify(data, null, 2));
        }
    });
};




