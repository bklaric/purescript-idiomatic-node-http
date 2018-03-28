"use strict";

exports.method = function (request) {
    return request.method
}

exports.url = function (request) {
    return request.url
}
