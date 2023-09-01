module.exports = class ErrorHandler extends Error{
    constructor(message , statusCode){
        super(message);

        this.statusCode = statusCode;
        this.timestamp = new Date();

        Error.captureStackTrace(this , this.constructor);
    }
}