const mongoose = require("mongoose");

const UserSchema = new mongoose.Schema({
    name:{
        type : String,
        required: true
    },
    email :{
        type : String,
        required: true
    },
    password :{
        type : String,
        required: [true, "Please , Enter the password!!"]
    },
    date :{
        type : String,
        default : new Date().toDateString()
    },
    isAdmin : {
        type : Boolean
    },
    phone: {
        type: String
      },

    profilePicture: {
      type: String
    },

    address: {
        street: {
          type : String,
          default :""
        },
        city: {
          type : String,
          default :""
        },
        state: {
          type : String,
          default :""
        },
        pincode: {
          type : String,
          default :""
        },
      },
      
    role : {
        type : String,
        default : "user",
        immutable : true
    },

    myCart: [
      {
        householdName: {
          type: String,
          required: true,
        },
        email: {
          type: String,
          required: true,
        },
        location: {
          type: String,
          required: true,
        },
        dishName: {
          type: String
        },
        price: {
          type: Number
        },
        about: {
          type: String
        },
        image:{
          type : String
        },
        quantity:{
          type : Number
        }
      }
    ],

    myOrders: [
      {
        householdName: {
          type: String,
          required: true,
        },
        email: {
          type: String,
          required: true,
        },
        location: {
          type: String,
          required: true,
        },
        dishName: {
          type: String
        },
        price: {
          type: Number
        },
        about: {
          type: String
        },
        image:{
          type : String
        },
        quantity:{
          type : Number
        },
        date: {
          type: Date,
          default: Date.now,
        },
        
      }
    ],
      
});

module.exports = mongoose.model("users" , UserSchema);