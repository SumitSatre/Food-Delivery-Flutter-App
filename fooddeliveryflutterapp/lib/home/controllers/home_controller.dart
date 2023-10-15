import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fooddeliveryflutterapp/home/model/household_products_model.dart';
import 'package:fooddeliveryflutterapp/home/model/user_model.dart';
import 'package:fooddeliveryflutterapp/utils/api_http_response.dart';
import 'package:fooddeliveryflutterapp/utils/http_wrappers.dart';
import 'package:fooddeliveryflutterapp/utils/services/shared_preferences_service.dart';
import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier{

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  List<HouseHoldProductModel>? houseHoldFoodsProducts;

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
    // debugPrint("This is profile data : ${data.toString()}");

    if (response.responseCode == 200) {
      print(response.responceString );
      _userModel = UserModel.fromJson(data);
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

    if (response.responseCode == 200) {
      // Assuming you have a static method to parse JSON into a list of HouseHoldProductModel
      houseHoldFoodsProducts = HouseHoldProductModel.listFromJson(json["userData"]);

      isDataFetched = true;

      notifyListeners();
    } else {
      isError = true;
      notifyListeners();
    }
  }

  Future<void> addItemInCart(CartItem foodItem) async {
    List<CartItem> updatedCart = List<CartItem>.from(_userModel!.myCart ?? []);
    updatedCart.add(foodItem);

    _userModel = _userModel!.copyWith(
      myCart: updatedCart,
    );

    notifyListeners();
  }

 //Future<void> removeItemInCart(CartItem foodItem) async {
 //  if (_userModel != null && _userModel!.myCart != null) {
 //    List<CartItem> updatedCart = List<CartItem>.from(_userModel!.myCart);

 //    // Remove the specific item from the cart based on a condition, for example, matching by some property like dishName.
 //    updatedCart.removeWhere((item) => item.dishName == foodItem.pricing.dishes);

 //    _userModel = _userModel!.copyWith(
 //      myCart: updatedCart,
 //    );

 //    notifyListeners();
 //  }
 // }


  Future<void> addItemInMyOrders(MyOrder foodItem) async {
    List<MyOrder> updatedMyOrders = List<MyOrder>.from(_userModel!.myOrders ?? []);
    updatedMyOrders.add(foodItem);

    _userModel = _userModel!.copyWith(
      myOrders: updatedMyOrders,
    );

    notifyListeners();
  }


}