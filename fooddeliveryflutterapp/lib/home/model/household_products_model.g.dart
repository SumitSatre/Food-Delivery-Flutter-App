// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'household_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodProductsHouseholdModel _$FoodProductsHouseholdModelFromJson(
        Map<String, dynamic> json) =>
    FoodProductsHouseholdModel(
      householdName: json['householdName'] as String,
      email: json['email'] as String,
      location: json['location'] as String,
      about: json['about'] as String,
      dishes: (json['dishes'] as List<dynamic>)
          .map((e) => Dish.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: (json['rating'] as num).toDouble(),
      kitchenCertification: json['kitchenCertification'] as bool,
      deliveryRadius: (json['deliveryRadius'] as num).toDouble(),
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      acceptablePaymentMethods:
          (json['acceptablePaymentMethods'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      foodPreparationTime: (json['foodPreparationTime'] as num?)?.toDouble(),
      allergenInformation: (json['allergenInformation'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FoodProductsHouseholdModelToJson(
        FoodProductsHouseholdModel instance) =>
    <String, dynamic>{
      'householdName': instance.householdName,
      'email': instance.email,
      'location': instance.location,
      'about': instance.about,
      'dishes': instance.dishes,
      'rating': instance.rating,
      'kitchenCertification': instance.kitchenCertification,
      'deliveryRadius': instance.deliveryRadius,
      'deliveryFee': instance.deliveryFee,
      'acceptablePaymentMethods': instance.acceptablePaymentMethods,
      'foodPreparationTime': instance.foodPreparationTime,
      'allergenInformation': instance.allergenInformation,
      'photos': instance.photos,
    };

Dish _$DishFromJson(Map<String, dynamic> json) => Dish(
      householdName: json['householdName'] as String,
      email: json['email'] as String,
      location: json['location'] as String,
      dishName: json['dishName'] as String,
      price: (json['price'] as num).toDouble(),
      about: json['about'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$DishToJson(Dish instance) => <String, dynamic>{
      'householdName': instance.householdName,
      'email': instance.email,
      'location': instance.location,
      'dishName': instance.dishName,
      'price': instance.price,
      'about': instance.about,
      'image': instance.image,
    };
