import ballerina/http;

const API_Host = "https://gateway.api.cloud.wso2.com/t/updateslive";
configurable string access_token = ?;

service /updates on new http:Listener(9090) {
    resource function get getUpdateSummary() returns json|error? {
        http:Client updates = check new (API_Host);

        json results = check updates->get("/updates/1.0.0/recommended-update-levels", {
            "Authorization": "Bearer " + access_token
        });

        return results;
    }
}