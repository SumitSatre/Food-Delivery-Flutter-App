// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'household_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseHoldProductModel _$HouseHoldProductModelFromJson(
        Map<String, dynamic> json) =>
    HouseHoldProductModel(
      id: json['id'] as String,
      pricing: json['pricing'] == null
          ? null
          : Pricing.fromJson(json['pricing'] as Map<String, dynamic>),
      householdName: json['householdName'] as String,
      email: json['email'] as String,
      location: json['location'] as String,
      about: json['about'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      kitchenCertification: json['kitchenCertification'] as bool?,
      deliveryRadius: (json['deliveryRadius'] as num).toDouble(),
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      acceptablePaymentMethods:
          (json['acceptablePaymentMethods'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      allergenInformation: (json['allergenInformation'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HouseHoldProductModelToJson(
        HouseHoldProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pricing': instance.pricing,
      'householdName': instance.householdName,
      'email': instance.email,
      'location': instance.location,
      'about': instance.about,
      'rating': instance.rating,
      'kitchenCertification': instance.kitchenCertification,
      'deliveryRadius': instance.deliveryRadius,
      'deliveryFee': instance.deliveryFee,
      'acceptablePaymentMethods': instance.acceptablePaymentMethods,
      'allergenInformation': instance.allergenInformation,
      'photos': instance.photos,
    };

Pricing _$PricingFromJson(Map<String, dynamic> json) => Pricing(
      cuisines: (json['cuisines'] as List<dynamic>?)
          ?.map((e) => Cuisine.fromJson(e as Map<String, dynamic>))
          .toList(),
      dishes: (json['dishes'] as List<dynamic>?)
          ?.map((e) => Dish.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PricingToJson(Pricing instance) => <String, dynamic>{
      'cuisines': instance.cuisines,
      'dishes': instance.dishes,
    };

Cuisine _$CuisineFromJson(Map<String, dynamic> json) => Cuisine(
      cuisineName: json['cuisineName'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$CuisineToJson(Cuisine instance) => <String, dynamic>{
      'cuisineName': instance.cuisineName,
      'price': instance.price,
      'id': instance.id,
    };

Dish _$DishFromJson(Map<String, dynamic> json) => Dish(
      dishName: json['dishName'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$DishToJson(Dish instance) => <String, dynamic>{
      'dishName': instance.dishName,
      'price': instance.price,
      'id': instance.id,
    };
