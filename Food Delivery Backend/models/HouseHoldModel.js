const mongoose = require('mongoose');

// Create a schema for the Household model
const householdSchema = new mongoose.Schema({
  householdName: {
    type: String,
    required: true,
    unique: true,
  },
  phoneNumber: {
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
  
  availability: {
    days: [String],
    times: [String],
  },

  about: {
    type: String,
    required: true,
  },
  
  dishes: [
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
      }
    },
  ],

  rating: {
    type: Number,
    default: 0,
  },
  reviews: [
    {
      text: String,
      rating: Number,
      customer: String,
    },
  ],
  kitchenCertification: {
    type: Boolean,
    default: false,
  },
  deliveryRadius: {
    type: Number,
    required: true,
  },
  deliveryFee: {
    type: Number,
    required: true,
  },
  acceptablePaymentMethods: [String],
  foodPreparationTime: {
    type: Number,
  },
  allergenInformation: [String],
  photos: [String], // You can store image URLs
  role: {
    type: String,
    default: 'Household Manager',
    immutable: true, 
  },
  
});

// Create a Mongoose model for the Household schema
const HouseHoldModel = mongoose.model('Household', householdSchema);

module.exports = HouseHoldModel;
