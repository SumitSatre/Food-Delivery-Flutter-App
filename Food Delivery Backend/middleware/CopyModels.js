const HouseHoldModel = require("../models/HouseHoldModel");
const FoodProductsHouseHoldModel = require("../models/FoodProductsHouseHoldModel");
const ErrorHandler = require("../errorHandler");

// Define a post-save middleware for HouseHoldModel
module.exports = async function (doc, next) {
  try {
    // Find a corresponding document in FoodProductsHouseHoldModel by email
    let model = await FoodProductsHouseHoldModel.findOne({ email: doc.email });

    if (model === null) {
      // If no matching document is found, create a new one in FoodProductsHouseHoldModel
      await FoodProductsHouseHoldModel.create({
        householdName: doc.householdName,
        email: doc.email,
        location: doc.location,
        about: doc.about,
        dishes: (doc.dishes || []).map(dish => ({
          householdName: dish.householdName,
          email: dish.email,
          location: dish.location,
          dishName: dish.dishName,
          price: dish.price,
          about: dish.about,
          image: dish.image
        })),
        rating: doc.rating,
        kitchenCertification: doc.kitchenCertification,
        deliveryRadius: doc.deliveryRadius,
        deliveryFee: doc.deliveryFee,
        acceptablePaymentMethods: doc.acceptablePaymentMethods,
        allergenInformation: doc.allergenInformation,
        photos: doc.photos
      });
    } else {
      // If a matching document is found, update it with the data from HouseHoldModel
      await FoodProductsHouseHoldModel.findOneAndUpdate(
        { email: doc.email },
        {
          $set: {
            householdName: doc.householdName,
            location: doc.location,
            about: doc.about,
            dishes: (doc.dishes || []).map(dish => ({
              householdName: dish.householdName,
              email: dish.email,
              location: dish.location,
              dishName: dish.dishName,
              price: dish.price,
              about: dish.about,
              image: dish.image
            })),
            rating: doc.rating,
            kitchenCertification: doc.kitchenCertification,
            deliveryRadius: doc.deliveryRadius,
            deliveryFee: doc.deliveryFee,
            acceptablePaymentMethods: doc.acceptablePaymentMethods,
            allergenInformation: doc.allergenInformation,
            photos: doc.photos
          }
        },
        { upsert: true }
      );
    }    

    // Send a success response
    console.log('Data sync and creation completed successfully');

    // Continue to the next middleware or the save operation
  } catch (error) {
    // Handle any errors that occur during data sync or creation
    console.error(error);
    throw new ErrorHandler("Server Problem", 500);
  }
}
