

exports.handler = (event, context, callback) => {
    var response;

    
    var successResponse = {
        "status": "success",
        "role": "U",
        "firstName": "Dave",
        "lastName": "Smith",
        "latestVersion": "null",
        "appVersion": "1.0",
        "type": "ipad",
        "daysToExpire": "-39",
        "positionNumber": "90 ",
        "dealerEmployeeNumber": "",
        "sessionToken": "fc16dd00-0140-4d71-b075-abf7c057dd96"
    };
    var failureResponse = {
        "status": "failure",
        "faultcode": "Error-604",
        "faultdetail": "Authentication Failure",
        "faultstring": "Failed to authenticate Dealer Credentials"
    }
    var r = Math.floor(Math.random() * 2);
    switch (r) {
        case 0:
            response = successResponse;
            break;
        case 1:
            response = failureResponse;
            break;
        default:
            break;
    }

    callback(null, { statusCode: 200, headers: { "content-type": "text/json" }, body: JSON.stringify(response) });
}


