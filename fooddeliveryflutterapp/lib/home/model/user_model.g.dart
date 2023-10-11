// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      isAdmin: json['isAdmin'] as bool,
      phone: json['phone'] as String?,
      profilePicture: json['profilePicture'] as String?,
      date: json['date'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      role: json['role'] as String,
      myCart: (json['myCart'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      myOrders: (json['myOrders'] as List<dynamic>?)
          ?.map((e) => MyOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'isAdmin': instance.isAdmin,
      'phone': instance.phone,
      'profilePicture': instance.profilePicture,
      'date': instance.date,
      'address': instance.address,
      'role': instance.role,
      'myCart': instance.myCart,
      'myOrders': instance.myOrders,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      street: json['street'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      pincode: json['pincode'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'pincode': instance.pincode,
    };

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      householdName: json['householdName'] as String,
      email: json['email'] as String,
      location: json['location'] as String,
      about: json['about'] as String?,
      pricing: Pricing.fromJson(json['pricing'] as Map<String, dynamic>),
      rating: (json['rating'] as num?)?.toDouble(),
      kitchenCertification: json['kitchenCertification'] as bool?,
      deliveryRadius: (json['deliveryRadius'] as num).toDouble(),
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble(),
      acceptablePaymentMethods:
          (json['acceptablePaymentMethods'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      foodPreparationTime: (json['foodPreparationTime'] as num?)?.toDouble(),
      allergenInformation: (json['allergenInformation'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'householdName': instance.householdName,
      'email': instance.email,
      'location': instance.location,
      'about': instance.about,
      'pricing': instance.pricing,
      'rating': instance.rating,
      'kitchenCertification': instance.kitchenCertification,
      'deliveryRadius': instance.deliveryRadius,
      'deliveryFee': instance.deliveryFee,
      'acceptablePaymentMethods': instance.acceptablePaymentMethods,
      'foodPreparationTime': instance.foodPreparationTime,
      'allergenInformation': instance.allergenInformation,
      'photos': instance.photos,
      'quantity': instance.quantity,
    };

Pricing _$PricingFromJson(Map<String, dynamic> json) => Pricing(
      dishes: (json['dishes'] as List<dynamic>?)
          ?.map((e) => Dish.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PricingToJson(Pricing instance) => <String, dynamic>{
      'dishes': instance.dishes,
    };

Dish _$DishFromJson(Map<String, dynamic> json) => Dish(
      dishName: json['dishName'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$DishToJson(Dish instance) => <String, dynamic>{
      'dishName': instance.dishName,
      'price': instance.price,
    };

MyOrder _$MyOrderFromJson(Map<String, dynamic> json) => MyOrder(
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderDate: DateTime.parse(json['orderDate'] as String),
    );

Map<String, dynamic> _$MyOrderToJson(MyOrder instance) => <String, dynamic>{
      'items': instance.items,
      'orderDate': instance.orderDate.toIso8601String(),
    };
