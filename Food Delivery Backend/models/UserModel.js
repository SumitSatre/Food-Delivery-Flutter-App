const mongoose = require("mongoose");

const CartItemSchema = new mongoose.Schema({
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
      about: {
        type: String
      },
    
      pricing: {
        dishes: [
          {
            dishName: {
              type: String
            },
            price: {
              type: Number
            },
          },
        ],
      },
    
      rating: {
        type: Number,
        default: 0,
      },
      kitchenCertification: {
        type: Boolean,
        default: false,
      },
      deliveryRadius: {
        type: Number
      },
      deliveryFee: {
        type: Number
      },
      acceptablePaymentMethods: [String],
      foodPreparationTime: {
        type: Number,
      },
      allergenInformation: [String],
      photos: [String],
    quantity: {
        type: Number
    }
});

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

    profilePicture: String,

    address: {
        street: String,
        city: String,
        state: String,
        pincode: String,
      },
      
    role : {
        type : String,
        default : "user",
        immutable : true
    },

    myCart: [CartItemSchema],

    myOrders: [
        {
            items: [CartItemSchema],
            orderDate: {
                type: Date,
                default: Date.now
            }
        }
    ]
      
});

module.exports = mongoose.model("users" , UserSchema);