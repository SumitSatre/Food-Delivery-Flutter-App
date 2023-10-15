import 'package:json_annotation/json_annotation.dart';

part 'household_products_model.g.dart';

@JsonSerializable()
class FoodProductsHouseholdModel {
  String householdName;
  String email;
  String location;
  String about;
  List<Dish> dishes;
  double rating;
  bool kitchenCertification;
  double deliveryRadius;
  double deliveryFee;
  List<String> acceptablePaymentMethods;
  double? foodPreparationTime;
  List<String> allergenInformation;
  List<String> photos;

  FoodProductsHouseholdModel({
    required this.householdName,
    required this.email,
    required this.location,
    required this.about,
    required this.dishes,
    required this.rating,
    required this.kitchenCertification,
    required this.deliveryRadius,
    required this.deliveryFee,
    required this.acceptablePaymentMethods,
    this.foodPreparationTime,
    required this.allergenInformation,
    required this.photos,
  });

  factory FoodProductsHouseholdModel.fromJson(Map<String, dynamic> json) =>
      _$FoodProductsHouseholdModelFromJson(json);

  Map<String, dynamic> toJson() => _$FoodProductsHouseholdModelToJson(this);

  static List<FoodProductsHouseholdModel> listFromJson(List<dynamic> jsonList) {
    List<FoodProductsHouseholdModel> list = [];
    for (var item in jsonList) {
      list.add(FoodProductsHouseholdModel.fromJson(item));
    }
    return list;
  }

  FoodProductsHouseholdModel copyWith({
    String? householdName,
    String? email,
    String? location,
    String? about,
    List<Dish>? dishes,
    double? rating,
    bool? kitchenCertification,
    double? deliveryRadius,
    double? deliveryFee,
    List<String>? acceptablePaymentMethods,
    double? foodPreparationTime,
    List<String>? allergenInformation,
    List<String>? photos,
  }) {
    return FoodProductsHouseholdModel(
      householdName: householdName ?? this.householdName,
      email: email ?? this.email,
      location: location ?? this.location,
      about: about ?? this.about,
      dishes: dishes ?? this.dishes,
      rating: rating ?? this.rating,
      kitchenCertification: kitchenCertification ?? this.kitchenCertification,
      deliveryRadius: deliveryRadius ?? this.deliveryRadius,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      acceptablePaymentMethods: acceptablePaymentMethods ?? this.acceptablePaymentMethods,
      foodPreparationTime: foodPreparationTime ?? this.foodPreparationTime,
      allergenInformation: allergenInformation ?? this.allergenInformation,
      photos: photos ?? this.photos,
    );
  }
}

@JsonSerializable()
class Dish {
  String householdName;
  String email;
  String location;
  String dishName;
  double price;
  String about;
  String image;

  Dish({
    required this.householdName,
    required this.email,
    required this.location,
    required this.dishName,
    required this.price,
    required this.about,
    required this.image,
  });

  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);

  Map<String, dynamic> toJson() => _$DishToJson(this);

  Dish copyWith({
    String? householdName,
    String? email,
    String? location,
    String? dishName,
    double? price,
    String? about,
    String? image,
  }) {
    return Dish(
      householdName: householdName ?? this.householdName,
      email: email ?? this.email,
      location: location ?? this.location,
      dishName: dishName ?? this.dishName,
      price: price ?? this.price,
      about: about ?? this.about,
      image: image ?? this.image,
    );
  }
}
