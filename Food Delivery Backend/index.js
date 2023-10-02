// Importing necessary modules and functions
const app = require("./app");
const connectDatabase = require("./config/database");

// It is middleware whch allows the specified server to access the backend server 
app.use((req , res , next)=>{
  res.setHeader("Access-Control-Allow-Origin" , process.env.FrontendWebAddress);
  res.header(
      "Access-Control-Allow-Headers",
      "Origin , X-Requested-With , Content-Type , Accept"
  )
  next();
});

// Handling Uncaught Exception
process.on("uncaughtException", (err) => {
  console.log(`Error: ${err.message}`);
  console.log(`Shutting down the server due to Uncaught Exception`);
  process.exit(1);
});

// Connect to the database
connectDatabase();

// Start the server and listen on the specified port
const server = app.listen(process.env.PORT, () => {
  console.log(`Server is working on http://localhost:${process.env.PORT}`);
});

// Handling Unhandled Promise Rejection
process.on("unhandledRejection", (err) => {
  console.log(`Error: ${err.message}`);
  console.log(`Shutting down the server due to Unhandled Promise Rejection`);

  // Close the server gracefully before exiting
  server.close(() => {
    process.exit(1);
  });
});
