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
    ApiHttpResponse response = await callUserPatchMethod(
        userModel!.toJson(), 'updateUserData', accessToken);
    if (response.responseCode == 200) {
      showSnackBar(context, "Profile updated successfully", Colors.green);
    }
    debugPrint(response.responceString);
  }

  Future<void> addItemInCart(CartItem foodItem) async {
    List<CartItem> updatedCart = List<CartItem>.from(_userModel!.myCart ?? []);
    updatedCart.add(foodItem);

    _userModel = _userModel!.copyWith(
      myCart: updatedCart,
    );

    notifyListeners();
  }

  Future<void> addItemsInCart(List<CartItem> itemsToAdd) async {
    // Create a copy of the existing cart items
    List<CartItem> updatedCart = List<CartItem>.from(_userModel!.myCart ?? []);

    // Loop through the items to add
    for (CartItem itemToAdd in itemsToAdd) {
      // Check if the item is already in the cart
      bool itemAlreadyInCart = false;
      for (int i = 0; i < updatedCart.length; i++) {
        if (updatedCart[i].dishName == itemToAdd.dishName) {
          // Item is already in the cart, increase its quantity
          updatedCart[i] = updatedCart[i].copyWith(
            quantity: updatedCart[i].quantity + itemToAdd.quantity,
          );
          itemAlreadyInCart = true;
          break;
        }
      }

      if (!itemAlreadyInCart) {
        // Item is not in the cart, add it
        updatedCart.add(itemToAdd);
      }
    }

    // Update the user's cart with the modified list
    _userModel = _userModel!.copyWith(
      myCart: updatedCart,
    );

    // Notify listeners of the change
    notifyListeners();
  }


  Future<void> removeItemInCart(CartItem foodItem) async {
    if (_userModel != null && _userModel!.myCart != null) {
      List<CartItem> updatedCart = List<CartItem>.from(_userModel!.myCart as Iterable);

      // Remove the specific item from the cart based on a condition, for example, matching by some property like dishName.
      updatedCart.removeWhere((item) => item.dishName == foodItem.dishName);

      _userModel = _userModel!.copyWith(
        myCart: updatedCart,
      );

      notifyListeners();
    }
  }



  Future<void> addItemInMyOrders(MyOrder foodItem) async {
    List<MyOrder> updatedMyOrders = List<MyOrder>.from(_userModel!.myOrders ?? []);
    updatedMyOrders.add(foodItem);

    _userModel = _userModel!.copyWith(
      myOrders: updatedMyOrders,
    );

    notifyListeners();
  }


}