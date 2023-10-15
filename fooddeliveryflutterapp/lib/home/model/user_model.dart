import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String id;
  String name;
  String email;
  String password;
  String date;
  bool isAdmin;
  String? phone;
  String? profilePicture;
  Address? address;
  String role;
  List<CartItem>? myCart;
  List<MyOrder>? myOrders;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.date,
    required this.isAdmin,
    this.phone,
    this.profilePicture,
    this.address,
    required this.role,
    this.myCart,
    this.myOrders,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class Address {
  String? street;
  String? city;
  String? state;
  String? pincode;

  Address({
    this.street,
    this.city,
    this.state,
    this.pincode,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class CartItem {
  String householdName;
  String email;
  String location;
  String dishName;
  double price;
  String about;
  String image;
  int quantity;

  CartItem({
    required this.householdName,
    required this.email,
    required this.location,
    required this.dishName,
    required this.price,
    required this.about,
    required this.image,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}

@JsonSerializable()
class MyOrder {
  String householdName;
  String email;
  String location;
  String dishName;
  double price;
  String about;
  String image;
  int quantity;
  DateTime date;

  MyOrder({
    required this.householdName,
    required this.email,
    required this.location,
    required this.dishName,
    required this.price,
    required this.about,
    required this.image,
    required this.quantity,
    required this.date,
  });

  factory MyOrder.fromJson(Map<String, dynamic> json) =>
      _$MyOrderFromJson(json);

  Map<String, dynamic> toJson() => _$MyOrderToJson(this);
}
