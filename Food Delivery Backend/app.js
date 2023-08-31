const express = require("express");
const app = express();

const errorMiddleware = require("./middleware/error");

const dotenv = require('dotenv');
dotenv.config({path : "./config/.env"});

app.use(express.json());

// Route Imports



app.get("*", (req, res) => {
    return next(new ErrorHandler(`Can't find ${req.originalUrl} on the server` , 404));
});

// Middleware for Errors
app.use(errorMiddleware);

module.exports = app;