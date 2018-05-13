"use strict";

var http = require("http")

exports.createImpl = function (requestListener) {
    return function () {
        return http.createServer(function (request, response) {
            requestListener(request)(response)()
        })
    }
}
