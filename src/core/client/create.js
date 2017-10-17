var AWS = require('aws-sdk');
var Sequelize = require("sequelize");
var dynamoDb;
var sequelize;

AWS.config.setPromisesDependency(require('bluebird'));
var clientModule = require('../../models/CLNT.js')

// Main entry point for lambda function
exports.handler = function (event, context, callback) {

    // Required to use mysql/sequelize otherwise function will wait for connection pool to die and timeout.
    context.callbackWaitsForEmptyEventLoop = false;

    // Create DynamoDB object
    if (process.env.AWS_SAM_LOCAL == "true" && !dynamoDb) {
        dynamoDb = new AWS.DynamoDB.DocumentClient({
            region: 'localhost',
            endpoint: 'http://dynamodb:8000'
        });
    }
    else if (!dynamoDb) {
        dynamoDb = new AWS.DynamoDB.DocumentClient();
    }

    // DyanmoDB parameters to get db config item
    var params = {
        Key: { key_option: "db" },
        TableName: "icar-config",
        AttributesToGet: ['config']
    };

    dynamoDb.get(params).promise()
        .then(result => {

            // get db config details
            const dbConfig = result.Item.config;
            console.log(result.Item);

            // Create Sequelize object (used to call mysql) with config options from dynamodb
            if (!sequelize)
                sequelize = new Sequelize(dbConfig.database, dbConfig.user, dbConfig.password, {
                    host: dbConfig.host,
                    dialect: 'mysql',
                    logging: true,
                });

            // add models neede for this function
            var clientModel = clientModule(sequelize, Sequelize);

            // Get Payload from API
            const body = JSON.parse(event.body);
            const data = body.familyOpportunity.clients[0];

            // create new client 
            var client = clientModel.build({
                clientKey: 1,
                personHashId: data.personHashId,
                prefix: data.prefix,
                suffix: data.suffix,
                firstName: data.firstName,
                middleName: data.middleInitial,
                lastName: data.lastName,
                preferLanguageCode: data.preferLanguageCode,
                preferPhoneTypeCode: data.preferPhoneTypeCode,
                preferEmailTypeCode: data.preferEmailTypeCode,
                companyName: data.companyName,
                createUserId: body.opportunity.salesUserID,
                createTimeStamp: Date.now,
                updateUserId: body.opportunity.salesUserID
            });
            
            // save new client to db
            client
                .save()
                .then(createdClient => {
                    // save succeded can now access saved client (hard coded return for now.)
                    var response = { "status": "success", "opportunityKey": createdClient.clientKey, "familyOpportunityKey": "555" }
                    callback(null, { statusCode: 200, headers: { "content-type": "text/json" }, body: JSON.stringify(response) });
                })
                .catch(error => {
                    // catch for db save error
                    callback(null, { statusCode: 500, headers: { "content-type": "text/json" }, body: JSON.stringify({ error }) })
                });
        })
        .catch(error => {
            // catch for dynamodb failure
            callback(null, { statusCode: 500, headers: { "content-type": "text/json" }, body: JSON.stringify(error) })
        });




}

