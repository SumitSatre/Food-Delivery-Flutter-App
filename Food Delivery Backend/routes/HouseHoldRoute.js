const express = require ('express');
const router = express.Router();

const { registerHouseholdManager , loginHouseholdManager} = require("../controllers/HouseHoldAuthController");
const { model } = require('mongoose');

const verifyToken = require("../middleware/verifyToken");

router.route("/loginHouseholdManager" ).post(loginHouseholdManager);
router.route("/registerHouseholdManager" ).post(registerHouseholdManager);

module.exports = router;