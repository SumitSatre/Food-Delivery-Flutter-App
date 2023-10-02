const ErrorHandler = require("../errorHandler");

module.exports = (req, res, next) => {
  const bearerHeader = req.headers['authorization'];
  if (typeof bearerHeader !== 'undefined') {
    const bearer = bearerHeader.split(" ");
    const token = bearer[1];
    req.token = token;
    next(); 
  } else {
    return next(new ErrorHandler("Token is invalid", 401));
  }
};
