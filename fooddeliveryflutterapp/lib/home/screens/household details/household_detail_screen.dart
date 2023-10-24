import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryflutterapp/home/controllers/home_controller.dart';
import 'package:fooddeliveryflutterapp/home/model/household_products_model.dart';
import 'package:fooddeliveryflutterapp/home/screens/household%20details/dish_card.dart';
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
      appBar: AppBar(
        toolbarHeight: 80, // Increase the height
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end, // Align the text to the bottom
          children: <Widget>[
            Text(
              houseHoldInfo!.householdName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Larger and bold
            ),
            Text(
              houseHoldInfo!.location,
              style: TextStyle(fontSize: 16),
            ),
          ],
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
