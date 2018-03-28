"use strict";

exports.defaultHttpVersion = function (message) {
    return message.httpVersion
}

exports.defaultRawHeaders = function (message) {
    return message.rawHeaders
}

exports.defaultHeaders = function (message) {
    return message.headers
}

exports.defaultTrailers = function (message) {
    return message.trailers
}

exports.defaultSetTimeout = function (milliseconds) {
    return function (callback) {
        return function (message) {
            return function () {
                return message.setTimeout(milliseconds, callback)
            }
        }
    }
}

exports.defaultDestroy = function (error) {
    return function (message) {
        return function () {
            message.destroy(error)
        }
    }
}
