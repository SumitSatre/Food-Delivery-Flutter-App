const ErrorHandler = require("../errorHandler");
const UserModel = require("../models/UserModel");
const HouseHoldModel = require("../models/HouseHoldModel");
const jwt = require("jsonwebtoken");

exports.getUserProfile = async (req , res , next)=>{
    jwt.verify(req.token , process.env.SECRETKEY , async (err , authData)=>{
        if(err){
            return next(new ErrorHandler("Token is invalid" , 401));
        }
        else{
            const userData = await UserModel.findOne({email : authData.user.email});
            return res.status(200).json({success : true , userData}); 
        }
    })
}

exports.getAllHouseholds = async (req , res , next)=>{
    jwt.verify(req.token , process.env.SECRETKEY , async (err , authData)=>{
        if(err){
            return next(new ErrorHandler("Token is invalid" , 401));
        }
        else{
            const userData = await HouseHoldModel.find();
            return res.status(200).json({success : true , userData}); 
        }
    })
}