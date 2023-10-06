import 'package:json_annotation/json_annotation.dart';

part 'household_products_model.g.dart';

@JsonSerializable()
class HouseHoldProductModel {
  String id;
  Pricing? pricing;
  String householdName;
  String email;
  String location;
  String? about;
  double? rating;
  bool? kitchenCertification;
  double deliveryRadius;
  double deliveryFee;
  List<String>? acceptablePaymentMethods;
  List<String>? allergenInformation;
  List<String>? photos;

  HouseHoldProductModel({
    required this.id,
     this.pricing,
    required this.householdName,
    required this.email,
    required this.location,
     this.about,
     this.rating,
     this.kitchenCertification,
    required this.deliveryRadius,
    required this.deliveryFee,
     this.acceptablePaymentMethods,
     this.allergenInformation,
    required this.photos,
  });

  factory HouseHoldProductModel.fromJson(Map<String, dynamic> json) =>
      _$HouseHoldProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$HouseHoldProductModelToJson(this);

  static List<HouseHoldProductModel> listFromJson(List<dynamic> jsonList) {
    List<HouseHoldProductModel> list = [];
    for (var item in jsonList) {
      list.add(HouseHoldProductModel.fromJson(item));
    }
    return list;
  }

  HouseHoldProductModel copyWith({
    String? id,
    Pricing? pricing,
    String? householdName,
    String? email,
    String? location,
    String? about,
    double? rating,
    bool? kitchenCertification,
    double? deliveryRadius,
    double? deliveryFee,
    List<String>? acceptablePaymentMethods,
    List<String>? allergenInformation,
    List<String>? photos,
  }) {
    return HouseHoldProductModel(
      id: id ?? this.id,
      pricing: pricing ?? this.pricing,
      householdName: householdName ?? this.householdName,
      email: email ?? this.email,
      location: location ?? this.location,
      about: about ?? this.about,
      rating: rating ?? this.rating,
      kitchenCertification: kitchenCertification ?? this.kitchenCertification,
      deliveryRadius: deliveryRadius ?? this.deliveryRadius,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      acceptablePaymentMethods: acceptablePaymentMethods ?? this.acceptablePaymentMethods,
      allergenInformation: allergenInformation ?? this.allergenInformation,
      photos: photos ?? this.photos,
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
  String? cuisineName;
  double? price;
  String? id;

  Cuisine({
    required this.cuisineName,
    required this.price,
    required this.id,
  });

  factory Cuisine.fromJson(Map<String, dynamic> json) =>
      _$CuisineFromJson(json);

  Map<String, dynamic> toJson() => _$CuisineToJson(this);

  Cuisine copyWith({
    String? cuisineName,
    double? price,
    String? id,
  }) {
    return Cuisine(
      cuisineName: cuisineName ?? this.cuisineName,
      price: price ?? this.price,
      id: id ?? this.id,
    );
  }
}

@JsonSerializable()
class Dish {
  String? dishName;
  double? price;
  String? id;

  Dish({
     this.dishName,
     this.price,
     this.id,
  });

  factory Dish.fromJson(Map<String, dynamic> json) =>
      _$DishFromJson(json);

  Map<String, dynamic> toJson() => _$DishToJson(this);

  Dish copyWith({
    String? dishName,
    double? price,
    String? id,
  }) {
    return Dish(
      dishName: dishName ?? this.dishName,
      price: price ?? this.price,
      id: id ?? this.id,
    );
  }
}
