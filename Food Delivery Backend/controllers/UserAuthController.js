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
      profilePicture: profilePicture || null
    });

    const user = {
      id: newUser._id,
      email: newUser.email,
      username: newUser.name,
      role : 'user'
    };

    const authToken = jwt.sign({ user }, process.env.SECRETKEY, { expiresIn: '86400s' });

    res.status(201).json({ success: true ,statusCode:200 ,  authToken});

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

    const authToken = jwt.sign({ user }, process.env.SECRETKEY, { expiresIn: '86400s' });

    return res.status(200).json({ success: true,statusCode:200, authToken });
  } catch (error) {
    next(error);
  }
};

