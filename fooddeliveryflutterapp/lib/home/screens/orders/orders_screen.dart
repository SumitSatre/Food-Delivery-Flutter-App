import 'package:flutter/material.dart';
import 'package:fooddeliveryflutterapp/home/controllers/home_controller.dart';
import 'package:fooddeliveryflutterapp/utils/snackBar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../model/user_model.dart';

class MyOrdersPage extends StatefulWidget {
  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {


  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeProvider>(context, listen: false);
    final userModel = Provider.of<HomeProvider>(context).userModel!;

    double totalPrice = controller.calculateTotalPrice();
    return Scaffold(
      appBar: AppBar(
        title: Text("🛒 My Orders"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: controller.userModel!.myOrders.length ?? 0,
          itemBuilder: (context, index) {
            if (controller.userModel!.myOrders.isEmpty) {
              return Container();
            }
            else {

              MyOrder cartItem = controller.userModel!.myOrders[index];

              // String dateString = cartItem.date;

              // DateTime dateTime = DateTime.parse(dateString);

              // String formattedDate = DateFormat('MMMM d, y').format(dateTime);

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 25,
                      alignment: Alignment.centerLeft,
                      child: Text("Ordered At: ${cartItem.date.toString()}" , style: TextStyle(
                        fontSize: 16 , fontWeight: FontWeight.bold , color: Colors.black
                      ),)
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Image(
                                image: NetworkImage(cartItem.image),
                                fit: BoxFit.cover,
                                height: 100,
                                width: 80,
                              ),
                            ),
                          ),

                          SizedBox(width: 10),

                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartItem.dishName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "\₹${cartItem.price * cartItem.quantity}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.blue,
                                  ),
                                ),

                                SizedBox(height: 5),

                                Row(
                                  children: [
                                    Icon(Icons.home, size: 18),
                                    SizedBox(width: 5),
                                    Text(
                                      cartItem.householdName,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Container(
                                  child: Text("Quantity : ${cartItem.quantity}" , style: TextStyle(
                                    fontSize: 15 , fontWeight: FontWeight.bold , color: Colors.black
                                  ),),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}