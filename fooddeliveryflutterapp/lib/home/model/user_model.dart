import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String id;
  String name;
  String email;
  String password;
  bool isAdmin;
  String? phone;
  String? profilePicture;
  String? date;
  Address? address;
  String role;
  List<CartItem>? myCart;
  List<MyOrder>? myOrders;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.isAdmin,
    this.phone,
    this.profilePicture,
    this.date,
    this.address,
    required this.role,
    this.myCart,
    this.myOrders,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    bool? isAdmin,
    String? phone,
    String? profilePicture,
    String? date,
    Address? address,
    String? role,
    List<CartItem>? myCart,
    List<MyOrder>? myOrders,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      isAdmin: isAdmin ?? this.isAdmin,
      phone: phone ?? this.phone,
      profilePicture: profilePicture ?? this.profilePicture,
      date: date ?? this.date,
      address: address ?? this.address,
      role: role ?? this.role,
      myCart: myCart ?? this.myCart,
      myOrders: myOrders ?? this.myOrders,
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
  String householdName;
  String email;
  String location;
  String? about;
  Pricing pricing;
  double? rating;
  bool? kitchenCertification;
  double deliveryRadius;
  double? deliveryFee;
  List<String> acceptablePaymentMethods;
  double? foodPreparationTime;
  List<String>? allergenInformation;
  List<String>? photos;
  int quantity;

  CartItem({
    required this.householdName,
    required this.email,
    required this.location,
    this.about,
    required this.pricing,
    this.rating,
    this.kitchenCertification,
    required this.deliveryRadius,
    this.deliveryFee,
    required this.acceptablePaymentMethods,
    this.foodPreparationTime,
    this.allergenInformation,
    this.photos,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);

  CartItem copyWith({
    String? householdName,
    String? email,
    String? location,
    String? about,
    Pricing? pricing,
    double? rating,
    bool? kitchenCertification,
    double? deliveryRadius,
    double? deliveryFee,
    List<String>? acceptablePaymentMethods,
    double? foodPreparationTime,
    List<String>? allergenInformation,
    List<String>? photos,
    int? quantity,
  }) {
    return CartItem(
      householdName: householdName ?? this.householdName,
      email: email ?? this.email,
      location: location ?? this.location,
      about: about ?? this.about,
      pricing: pricing ?? this.pricing,
      rating: rating ?? this.rating,
      kitchenCertification: kitchenCertification ?? this.kitchenCertification,
      deliveryRadius: deliveryRadius ?? this.deliveryRadius,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      acceptablePaymentMethods: acceptablePaymentMethods ?? this.acceptablePaymentMethods,
      foodPreparationTime: foodPreparationTime ?? this.foodPreparationTime,
      allergenInformation: allergenInformation ?? this.allergenInformation,
      photos: photos ?? this.photos,
      quantity: quantity ?? this.quantity,
    );
  }
}

@JsonSerializable()
class Pricing {
  List<Cuisine>? cuisines;
  List<Dish>? dishes;

  Pricing({
    this.cuisines,
    this.dishes,
  });

  factory Pricing.fromJson(Map<String, dynamic> json) =>
      _$PricingFromJson(json);

  Map<String, dynamic> toJson() => _$PricingToJson(this);

  Pricing copyWith({
    List<Cuisine>? cuisines,
    List<Dish>? dishes,
  }) {
    return Pricing(
      cuisines: cuisines ?? this.cuisines,
      dishes: dishes ?? this.dishes,
    );
  }
}

@JsonSerializable()
class Cuisine {
  String cuisineName;
  double price;

  Cuisine({
    required this.cuisineName,
    required this.price,
  });

  factory Cuisine.fromJson(Map<String, dynamic> json) =>
      _$CuisineFromJson(json);

  Map<String, dynamic> toJson() => _$CuisineToJson(this);

  Cuisine copyWith({
    String? cuisineName,
    double? price,
  }) {
    return Cuisine(
      cuisineName: cuisineName ?? this.cuisineName,
      price: price ?? this.price,
    );
  }
}

@JsonSerializable()
class Dish {
  String dishName;
  double price;

  Dish({
    required this.dishName,
    required this.price,
  });

  factory Dish.fromJson(Map<String, dynamic> json) =>
      _$DishFromJson(json);

  Map<String, dynamic> toJson() => _$DishToJson(this);

  Dish copyWith({
    String? dishName,
    double? price,
  }) {
    return Dish(
      dishName: dishName ?? this.dishName,
      price: price ?? this.price,
    );
  }
}

@JsonSerializable()
class MyOrder {
  List<CartItem> items;
  DateTime orderDate;

  MyOrder({
    required this.items,
    required this.orderDate,
  });

  factory MyOrder.fromJson(Map<String, dynamic> json) =>
      _$MyOrderFromJson(json);

  Map<String, dynamic> toJson() => _$MyOrderToJson(this);

  MyOrder copyWith({
    List<CartItem>? items,
    DateTime? orderDate,
  }) {
    return MyOrder(
      items: items ?? this.items,
      orderDate: orderDate ?? this.orderDate,
    );
  }
}
