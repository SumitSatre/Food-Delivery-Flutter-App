const mongoose = require("mongoose");
const ErrorHandler = require("../errorHandler");

const connectDatabase = () => {
  mongoose
    .connect(process.env.DB_URL, {
      useNewUrlParser: true,
      useUnifiedTopology: true
    })
    .then((data) => {
      console.log(`Mongodb connected with server: ${data.connection.host}`);
    })
    .catch((error) => {
      // Create an instance of ErrorHandler and throw the error
      const errorHandler = new ErrorHandler("Unable to connect MongoDB server", 400);
      throw errorHandler;
    });
};

module.exports = connectDatabase;