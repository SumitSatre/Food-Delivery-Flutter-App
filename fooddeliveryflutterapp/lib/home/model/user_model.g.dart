// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      date: json['date'] as String,
      phone: json['phone'] as String?,
      profilePicture: json['profilePicture'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      role: json['role'] as String,
      myCart: (json['myCart'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      myOrders: (json['myOrders'] as List<dynamic>)
          .map((e) => MyOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'date': instance.date,
      'phone': instance.phone,
      'profilePicture': instance.profilePicture,
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
      dishId: json['dishId'] as String,
      email: json['email'] as String,
      location: json['location'] as String,
      dishName: json['dishName'] as String,
      price: (json['price'] as num).toDouble(),
      about: json['about'] as String,
      image: json['image'] as String,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'dishId': instance.dishId,
      'householdName': instance.householdName,
      'email': instance.email,
      'location': instance.location,
      'dishName': instance.dishName,
      'price': instance.price,
      'about': instance.about,
      'image': instance.image,
      'quantity': instance.quantity,
    };

MyOrder _$MyOrderFromJson(Map<String, dynamic> json) => MyOrder(
      householdName: json['householdName'] as String,
      email: json['email'] as String,
      location: json['location'] as String,
      dishName: json['dishName'] as String,
      price: (json['price'] as num).toDouble(),
      about: json['about'] as String,
      image: json['image'] as String,
      quantity: json['quantity'] as int,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$MyOrderToJson(MyOrder instance) => <String, dynamic>{
      'householdName': instance.householdName,
      'email': instance.email,
      'location': instance.location,
      'dishName': instance.dishName,
      'price': instance.price,
      'about': instance.about,
      'image': instance.image,
      'quantity': instance.quantity,
      'date': instance.date.toIso8601String(),
    };
