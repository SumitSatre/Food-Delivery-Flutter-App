const ErrorHandler = require("../errorHandler");
const UserModel = require("../models/UserModel");
const HouseHoldModel = require("../models/HouseHoldModel");
const FoodProductsHouseHoldModel = require("../models/FoodProductsHouseHoldModel");
const jwt = require("jsonwebtoken");

exports.getUserProfile = async (req , res , next)=>{
    jwt.verify(req.token , process.env.SECRETKEY , async (err , authData)=>{
        if(err){
            return next(new ErrorHandler("Token is invalid" , 401));
        }
        else{
            const userData = await UserModel.findOne({email : authData.user.email});
            return res.status(200).json({success : true ,statusCode:200,  userData}); 
        }
    })
}

exports.getAllHouseholds = async (req , res , next)=>{
    jwt.verify(req.token , process.env.SECRETKEY , async (err , authData)=>{
        if(err){
            return next(new ErrorHandler("Token is invalid" , 401));
        }
        else{
            const userData = await FoodProductsHouseHoldModel.find();
            return res.status(200).json({success : true ,statusCode:200,  userData}); 
        }
    })
}

exports.updateUserModel = async (req , res , next)=>{
    jwt.verify(req.token , process.env.SECRETKEY , async (err , authData)=>{
        if(err){
            return next(new ErrorHandler("Token is invalid" , 401));
        }
        else{
            try {
                const updateFields = req.body;
                const user = await UserModel.findOne({ email: authData.user.email });
                            
                if (!user) {
                  return res.status(404).json({ message: 'User not found' });
                }
                
                // Define the fields you want to update
                const fieldsToUpdate = {};
                
                if (updateFields.address) {
                  fieldsToUpdate.address = {
                    street: updateFields.address.street || user.address.street,
                    city: updateFields.address.city || user.address.city,
                    state: updateFields.address.state || user.address.state,
                    pincode: updateFields.address.pincode || user.address.pincode,
                  };
                } else {
                  fieldsToUpdate.address = user.address; // Keep the existing address
                }
                
                fieldsToUpdate.phone = updateFields.phone || user.phone;
                fieldsToUpdate.profilePicture = updateFields.profilePicture || user.profilePicture;
                fieldsToUpdate.myCart = updateFields.myCart || user.myCart;
                fieldsToUpdate.myOrders = updateFields.myOrders || user.myOrders;
                
                // Update the user object with the specified fields
                user.set(fieldsToUpdate);
                
                // Save the updated user object
                const updatedUser = await user.save();
                
                return res.status(200).json({ message: 'User updated successfully', user: updatedUser });
                
              } catch (err) {
                return next(err);
              }
        }
    })
}