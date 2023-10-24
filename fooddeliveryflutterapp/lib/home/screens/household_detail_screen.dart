import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryflutterapp/home/controllers/home_controller.dart';
import 'package:fooddeliveryflutterapp/home/model/household_products_model.dart';
import 'package:fooddeliveryflutterapp/home/screens/dish_card.dart';
import 'package:provider/provider.dart';

class MyPage extends StatefulWidget {

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    final FoodProductsHouseholdModel? houseHoldInfo = ModalRoute.of(context)?.settings.arguments as FoodProductsHouseholdModel?;

    final userModel = Provider.of<HomeProvider>(context).userModel!;

    final controller = Provider.of<HomeProvider>(context, listen: false);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: Container(

          color: Colors.indigo.shade50,
          child: Row(
            children: <Widget>[

              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      houseHoldInfo?.photos?.isNotEmpty == true
                          ? houseHoldInfo!.photos![0] ?? ""
                          : "https://source.unsplash.com/random/900x700/?food",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    houseHoldInfo!.householdName,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    houseHoldInfo!.location,
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    houseHoldInfo!.foodPreparationTime.toString(),
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: houseHoldInfo!.dishes?.length ?? 0,
          itemBuilder: (context, index) {
            return DishCard(dish: houseHoldInfo!.dishes[index]);
          },
        ),
      ),
    );
  }
}
