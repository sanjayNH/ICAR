

exports.handler = (event, context, callback) => {
    switch (event.httpMethod) {
        case "POST":

            callback(null, { statusCode: 200, headers: { "content-type": "text/plain" }, body: "This is a CREATE operation" });
            break;

        case "PUT":
            callback(null, { statusCode: 200, headers: { "content-type": "text/plain" }, body: "This is an UPDATE operation on product ID " + id });
            break;

        default:
            // Send HTTP 501: Not Implemented
            console.log("Error: unsupported HTTP method (" + event.httpMethod + ")");
            callback(null, { statusCode: 501 })

    }
}