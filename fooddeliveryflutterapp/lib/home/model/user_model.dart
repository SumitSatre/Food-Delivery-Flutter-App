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
}

class Address {
  String? street;
  String? city;
  String? state;
  String? postalCode;

  Address({
    this.street,
    this.city,
    this.state,
    this.postalCode,
  });
}

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
}

class Pricing {
  List<Cuisine>? cuisines;
  List<Dish>? dishes;

  Pricing({
    this.cuisines,
    this.dishes,
  });
}

class Cuisine {
  String cuisineName;
  double price;

  Cuisine({
    required this.cuisineName,
    required this.price,
  });
}

class Dish {
  String dishName;
  double price;

  Dish({
    required this.dishName,
    required this.price,
  });
}

class MyOrder {
  List<CartItem> items;
  DateTime orderDate;

  MyOrder({
    required this.items,
    required this.orderDate,
  });
}
