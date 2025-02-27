const ErrorHandler = require("../errorHandler");
const HouseHoldModel = require("../models/HouseHoldModel");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const postSaveCopyMiddleware = require("../middleware/CopyModels");

// Authentication of household
exports.registerHouseholdManager = async (req, res, next) => {
  try {
    const {
      householdName,
      location,
      phoneNumber,
      email,
      availability,
      about,
      dishes,
      rating,
      reviews,
      kitchenCertification,
      deliveryRadius,
      deliveryFee,
      acceptablePaymentMethods,
      foodPreparationTime,
      allergenInformation,
      photos,
      password // Include password in the registration data
    } = req.body;

    // Check if required fields are provided
    if (
      !householdName ||
      !location ||
      !phoneNumber ||
      !email ||
      !about ||
      !deliveryRadius ||
      !deliveryFee ||
      !foodPreparationTime ||
      !password
    ) {
      return next(new ErrorHandler("Please Enter all details", 400));
    }

    const salt = await bcrypt.genSalt(10); // Generate a salt
    const hashedPassword = await bcrypt.hash(password, salt); // Hash the provided password

    const newHousehold = new HouseHoldModel({
      householdName,
      location,
      phoneNumber,
      email,
      password: hashedPassword, // Store the hashed password
      about,
      dishes,
      deliveryRadius,
      deliveryFee,
      foodPreparationTime,
      availability,
      rating,
      reviews,
      kitchenCertification,
      acceptablePaymentMethods,
      allergenInformation,
      photos,
    });

    let household = await newHousehold.save();
    // console.log(household);

    const user = {
      id: household._id,
      email: household.email,
      username: household.name,
      role: 'HouseHold Manager',
    };

    const authToken = jwt.sign({ user }, process.env.SECRETKEY, { expiresIn: '86400s' });

    res.status(200).json({ success: true,statusCode:200,  message: "Household data saved successfully", authToken });

    postSaveCopyMiddleware(household);

  } catch (error) {
    return next(new ErrorHandler(`Error saving household data: ${error.message}`, 500));
  }
};


exports.loginHouseholdManager = async (req, res, next) => {
    // Assuming that req.token contains the user's JWT token
    try {
      const {
        email,
        password 
      } = req.body;
  
      // Check if required fields are provided
      if (
        !email ||
        !password 
      ) {
        return next(new ErrorHandler("Please Enter all details", 400)); // Changed status code to 400 for a bad request
      }
  
      
      const householdManager = await HouseHoldModel.findOne({"email" : email});

      if (!householdManager) {
        throw new ErrorHandler("manager does not exist!!", 401);
      }
  
      const pwdCompare = await bcrypt.compare(req.body.password, householdManager.password);
  
      if (!pwdCompare) {
        throw new ErrorHandler("Please!! Enter Correct Password", 401);
      }


      const user = {
        id: householdManager._id,
        email: householdManager.email,
        username: householdManager.name,
        role : 'Household Manager'
      };
  
      const authToken = jwt.sign({ user }, process.env.SECRETKEY, { expiresIn: '86400s' });
  
      // Optionally, you can return a success response
      res.status(200).json({ success : true ,statusCode:200,  message: "Household data saved successfully" , authToken});

    } catch (error) {
      // Handle any errors that occur during data validation or saving
      return next(new ErrorHandler(`Error saving household data ${error}`, 500));
    }
  };


  