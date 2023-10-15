// const mongodb = require('mongodb');
const ErrorHandler = require("../errorHandler");
const UserModel = require("../models/UserModel");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

exports.RegisterUser = async (req, res, next) => {
  try {
    const { email, name, password, location, address, phone, profilePicture } = req.body;

    if (!email || !name || !password) {
      throw new ErrorHandler("Please enter all details", 400);
    }

    const existingUser = await UserModel.findOne({ "email" : email});

    if (existingUser) {
      return res.status(400).json({ success: false, message: "User Already Exist!!" });
    }

    const salt = await bcrypt.genSalt(10); // Generate a salt
    const hashedPassword = await bcrypt.hash(password, salt);

    const newUser = await UserModel.create({
      name,
      password: hashedPassword,
      email,
      location,
      isAdmin: false,
      address: address || null,
      phone: phone || null,
      profilePicture: profilePicture || "data:image/jpeg;base64,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",
      myCart : [],
      myOrders : []
    });

    const user = {
      id: newUser._id,
      email: newUser.email,
      username: newUser.name
    };

    const authToken = jwt.sign({ user }, process.env.SECRETKEY);

    res.status(201).json({ success: true ,statusCode:200 ,  authToken , newUser});

    next();
  } catch (error) {
    next(error);
  }
};



exports.LoginUser = async (req, res, next) => {
  try {
    if (!req.body.email || !req.body.password) {
      throw new ErrorHandler("Please enter all details", 400);
    }

    const userData = await UserModel.findOne({ email: req.body.email });

    if (!userData) {
      throw new ErrorHandler("User does not exist!!", 401);
    }

    const pwdCompare = await bcrypt.compare(req.body.password, userData.password);

    if (!pwdCompare) {
      throw new ErrorHandler("Please!! Enter Correct Password", 401);
    }

    const user = {
      id: userData._id,
      email: userData.email,
      username: userData.name,
      role : 'user'
    };

    const authToken = jwt.sign({ user }, process.env.SECRETKEY);

    return res.status(200).json({ success: true,statusCode:200, authToken });
  } catch (error) {
    next(error);
  }
};

