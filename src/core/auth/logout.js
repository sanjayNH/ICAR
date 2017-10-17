
exports.handler = (event, context, callback) => {
    var response;
    var successResponse = {
        "status": "success"
    };

    var failureResponse = {
        "status": "failure",
        "faultcode": "Error-648",
        "faultdetail": "No records found for the provided data",
        "faultstring": "No records found for the provided data"
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
