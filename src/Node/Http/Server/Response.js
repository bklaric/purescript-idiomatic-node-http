"use strict";

exports.addTrailers = function (trailers) {
    return function (response) {
        return function () {
            response.addTrailers(trailers)
        }
    }
}

exports.finished = function (response) {
    return function () {
        return response.finished
    }
}

exports.getHeader = function (headerName) {
    return function (response) {
        return function () {
            return response.getHeader(headerName)
        }
    }
}

exports.getHeaderNames = function (response) {
    return function () {
        return response.getHeaderNames()
    }
}

exports.getHeaders = function (response) {
    return function () {
        return response.getHeaders()
    }
}

exports.hasHeader = function (headerName) {
    return function (response) {
        return function () {
            return response.hasHeader(headerName)
        }
    }
}

exports.headersSent = function (response) {
    return function () {
        return response.headersSent
    }
}

exports.removeHeader = function (headerName) {
    return function (response) {
        return function () {
            response.removeHeader(headerName)
        }
    }
}

exports.getSendDate = function (response) {
    return function () {
        return response.sendDate
    }
}

exports.setSendDate = function (sendDate) {
    return function (response) {
        return function () {
            response.sendDate = sendDate
        }
    }
}

exports.setHeader = function (headerName) {
    return function (headerValue) {
        return function (response) {
            return function () {
                response.setHeader(headerName, headerValue)
            }
        }
    }
}

exports["setHeader'"] = function (headerName) {
    return function (headerValues) {
        return function (response) {
            return function () {
                response.setHeader(headerName, headerValues)
            }
        }
    }
}

exports.defaultSetTimeout = function (milliseconds) {
    return function (callback) {
        return function (response) {
            return function () {
                return response.setTimeout(milliseconds, callback)
            }
        }
    }
}

exports.getStatusCode = function (response) {
    return function () {
        return response.statusCode
    }
}

exports.setStatusCode = function (statusCode) {
    return function (response) {
        return function () {
            response.statusCode = statusCode
        }
    }
}

exports.getStatusMessage = function (response) {
    return function () {
        return response.statusMessage
    }
}

exports.setStatusMessage = function (statusMessage) {
    return function (response) {
        return function () {
            response.statusMessage = statusMessage
        }
    }
}

exports.writeContinue = function (response) {
    return function () {
        response.writeContinue()
    }
}

exports.writeHead = function (statusCode) {
    return function (statusMessage) {
        return function (headers) {
            return function (response) {
                return function () {
                    response.writeHead(statusCode, statusMessage, headers)
                }
            }
        }
    }
}
