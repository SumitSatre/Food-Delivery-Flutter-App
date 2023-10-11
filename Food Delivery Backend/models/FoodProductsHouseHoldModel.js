const mongoose = require('mongoose');

// Create a simplified schema for the Household DTO
const foodProductsHouseHoldSchema = new mongoose.Schema({
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
    type: String,
    required: true,
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
  photos: [String],
});


const foodProductsHouseHoldModel = mongoose.model('HouseholdDataList', foodProductsHouseHoldSchema);

module.exports = foodProductsHouseHoldModel;
