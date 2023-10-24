import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryflutterapp/home/model/household_products_model.dart';
import 'package:fooddeliveryflutterapp/home/model/user_model.dart';
import 'package:fooddeliveryflutterapp/utils/api_http_response.dart';
import 'package:fooddeliveryflutterapp/utils/http_wrappers.dart';
import 'package:fooddeliveryflutterapp/utils/services/shared_preferences_service.dart';
import 'package:fooddeliveryflutterapp/utils/snackBar.dart';
import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier{

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  List<FoodProductsHouseholdModel>? houseHoldFoodsProducts;

  late bool isDataFetched = false;
  late bool isError = false;

  void init() async {
    await sendUserGetRequest();
  }

  Future<void> sendUserGetRequest() async {
    String accessToken = await SharedPreferenceService().getAccessToken();
    // print(accessToken);
    ApiHttpResponse response =
    await callUserGetMethod("/UserProfile", accessToken);
    final json = jsonDecode(response.responceString!);
    // debugPrint("This is profile json : ${json.toString()}");

    final data = json["userData"];
    debugPrint("This is profile data : ${data.toString()}");

    if (response.responseCode == 200) {
      print(response.responceString );
      _userModel = UserModel.fromJson(data);

      print("This is address ${userModel?.address?.city ?? "city"}");
      notifyListeners();
    } else {
      notifyListeners();
    }
  }

  Future<void> getHouseHoldFoodProducts() async {
    String accessToken = await SharedPreferenceService().getAccessToken();
    // print(accessToken);
    ApiHttpResponse response =
    await callUserGetMethod("/allHouseholds", accessToken);
    final json = jsonDecode(response.responceString!);
    // print("This is data : $json");

    if (response.responseCode == 200) {
      // Assuming you have a static method to parse JSON into a list of HouseHoldProductModel
      houseHoldFoodsProducts = FoodProductsHouseholdModel.listFromJson(json["userData"]);

      isDataFetched = true;

      notifyListeners();
    } else {
      isError = true;
      notifyListeners();
    }
  }

  void updateProfile(BuildContext context) async {
    String accessToken = await SharedPreferenceService().getAccessToken();
    print(jsonEncode(userModel!.toJson()));
    ApiHttpResponse response = await callUserPutMethod(
        userModel!.toJson(), '/updateUserData', accessToken);
    if (response.responseCode == 200) {
      // showSnackBar(context, "Profile updated successfully", Colors.green);
    }
    debugPrint(response.responceString);
  }

  Future<void> addItemInCart(Dish dish , int quantity) async {

    List<CartItem> updatedCart = List<CartItem>.from(_userModel!.myCart ?? []);

    CartItem foodItem = CartItem(
        dishId : dish.id,
        householdName: dish.householdName,
        email: dish.email,
        location: dish.location,
        dishName: dish.dishName,
        price: dish.price,
        about: dish.about,
        image: dish.image,
        quantity: quantity
    );

    bool itemAlreadyInCart = false;

    for (int i = 0; i < updatedCart.length; i++) {
      if(updatedCart[i].dishName == foodItem.dishName){
        updatedCart[i].quantity += quantity;
        itemAlreadyInCart = true;
        break;
      }
    }

    if(!itemAlreadyInCart){
      updatedCart.add(foodItem);
    }

    _userModel = _userModel!.copyWith(
      myCart: updatedCart,
    );

    notifyListeners();
  }

  Future<void> removeItemInCart(CartItem foodItem) async {
    if (_userModel != null && _userModel!.myCart != null) {
      List<CartItem> updatedCart = List<CartItem>.from(_userModel!.myCart as Iterable);

      print("updaed cart before length ${updatedCart.length}");

      updatedCart.removeWhere((item) => item.dishId == foodItem.dishId);

      print("updaed cart after length ${updatedCart.length}");
      _userModel = _userModel!.copyWith(
        myCart: updatedCart,
      );

      notifyListeners();
    }
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;

    for (CartItem item in _userModel!.myCart) {
      totalPrice += item.price * item.quantity;
    }

    notifyListeners();

    return double.parse(totalPrice.toStringAsFixed(2));
  }

  void buyNowCart(){
    if (_userModel != null && _userModel!.myCart != null) {
      List<MyOrder> myOrdersList = List<MyOrder>.from(_userModel!.myOrders as Iterable);

      List<CartItem> updatedCart = List<CartItem>.from(_userModel!.myCart as Iterable);

      for (CartItem item in _userModel!.myCart) {
        myOrdersList.add(MyOrder(
            householdName: item.householdName,
            email: item.email,
            location: item.location,
            dishName: item.dishName,
            price: item.price,
            about: item.about,
            image: item.image,
            quantity: item.quantity,
            date: DateTime.now()
        ));
      }
      _userModel = _userModel!.copyWith(
        myCart: [],
        myOrders: myOrdersList
      );

      notifyListeners();
    }
  }

  void updateUserName(String? val){
    if(_userModel != null){
      _userModel = _userModel!.copyWith(
        name: val
      );
    }
    notifyListeners();
  }

  void updateUserPhoneNumber(String? val){
    if(_userModel != null){
      _userModel = _userModel!.copyWith(
          phone: val
      );
    }
    notifyListeners();
  }

  void updateUserCity(String? val){
    if(_userModel != null){
      _userModel = _userModel!.copyWith(
          address: _userModel!.address!.copyWith(
            city: val
          )
      );
    }
    notifyListeners();
  }

}