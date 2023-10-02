const express = require ('express');
const { model } = require('mongoose');
const router = express.Router();

const verifyToken = require('../middleware/verifyToken');

const {RegisterUser , LoginUser} = require("../controllers/UserAuthController");
const {getUserProfile , getAllHouseholds} =  require("../controllers/UserController");

router.route("/registerUser").post(RegisterUser);
router.route("/loginUser").post(LoginUser);

router.route("/UserProfile").get(verifyToken , getUserProfile);
router.route("/allHouseholds").get(verifyToken , getAllHouseholds);
// router.route("/loginUser").get(LoginUser);

module.exports = router;