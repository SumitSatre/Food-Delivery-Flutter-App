import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String id;
  String name;
  String email;
  String date;
  String? phone;
  String? profilePicture;
  Address? address;
  String role;
  List<CartItem> myCart;
  List<MyOrder> myOrders;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.date,
    this.phone,
    this.profilePicture,
    this.address,
    required this.role,
    required this.myCart,
    required this.myOrders,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? date,
    String? phone,
    String? profilePicture,
    Address? address,
     String? role,
    List<CartItem>? myCart,
    List<MyOrder>? myOrders,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      date: date ?? this.date,
      role: role ?? this.role,
      phone: phone ?? this.phone,
      myCart: myCart ?? this.myCart,
      myOrders: myOrders ?? this.myOrders,
      address: address ?? this.address,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }
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

  Address copyWith({
    String? street,
    String? city,
    String? state,
    String? pincode,
  }) {
    return Address(
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
    );
  }
}

@JsonSerializable()
class CartItem {
  String dishId;
  String householdName;
  String email;
  String location;
  String dishName;
  double price;
  String about;
  String image;
  int quantity;

  CartItem({
    required this.dishId,
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

  CartItem copyWith({
    String? dishId,
    String? householdName,
    String? email,
    String? location,
    String? dishName,
    double? price,
    String? about,
    String? image,
    int? quantity,
  }) {
    return CartItem(
      dishId: dishId ?? this.dishId,
      householdName: householdName ?? this.householdName,
      email: email ?? this.email,
      location: location ?? this.location,
      dishName: dishName ?? this.dishName,
      price: price ?? this.price,
      about: about ?? this.about,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
    );
  }
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

  MyOrder copyWith({
    String? householdName,
    String? email,
    String? location,
    String? dishName,
    double? price,
    String? about,
    String? image,
    int? quantity,
    DateTime? date,
  }) {
    return MyOrder(
      householdName: householdName ?? this.householdName,
      email: email ?? this.email,
      location: location ?? this.location,
      dishName: dishName ?? this.dishName,
      price: price ?? this.price,
      about: about ?? this.about,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      date: date ?? this.date,
    );
  }
}
