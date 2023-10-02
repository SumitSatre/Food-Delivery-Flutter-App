const express = require("express");
const app = express();

const errorMiddleware = require("./middleware/error");
const ErrorHandler = require("./errorHandler");

const dotenv = require('dotenv');
dotenv.config({path : "./config/.env"});

app.use(express.json());

// Route Imports

const userRoute = require("./routes/UserRoute");
const HouseHoldRoute = require("./routes/HouseHoldRoute");

app.use("/api/v1" , userRoute);
app.use("/api/v1" , HouseHoldRoute);

app.get("*", (req, res,next) => {
    return next(new ErrorHandler(`Can't find ${req.originalUrl} on the server` , 404));
});

// Middleware for Errors
app.use(errorMiddleware);

module.exports = app;