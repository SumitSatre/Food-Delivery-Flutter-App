import 'package:flutter/material.dart';
import 'package:fooddeliveryflutterapp/home/controllers/home_controller.dart';
import 'package:fooddeliveryflutterapp/utils/snackBar.dart';
import 'package:provider/provider.dart';

import '../../model/user_model.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {


  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeProvider>(context, listen: false);
    final userModel = Provider.of<HomeProvider>(context).userModel!;

    double totalPrice = controller.calculateTotalPrice();
    return Scaffold(
      appBar: AppBar(
        title: Text("🛒 My Cart"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: controller.userModel!.myCart.length ?? 0,
          itemBuilder: (context, index) {
            if (controller.userModel!.myCart.isEmpty) {
              return Container();
            }
            else {

              CartItem cartItem = controller.userModel!.myCart[index];

              return Container(
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
                            "₹${cartItem.price * cartItem.quantity}",
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
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    cartItem.quantity--;
                                    if(cartItem.quantity <= 0){
                                      controller.removeItemInCart(cartItem);
                                      controller.updateProfile(context);
                                      showSnackBar(context, "Item removed successfully!!", Colors.redAccent);
                                    }
                                  });
                                },
                                icon: Icon(Icons.remove),
                              ),
                              Text(
                                "${cartItem.quantity}",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    cartItem.quantity++;
                                  });
                                },
                                icon: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.removeItemInCart(cartItem);
                        controller.updateProfile(context);
                        showSnackBar(context, "Item removed successfully!!", Colors.redAccent);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text(
                  "Total Price : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "${totalPrice}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Container(
              height: 35,
              width: 170,
              child: ElevatedButton(
                onPressed: () {
                  controller.buyNowCart();
                  controller.updateProfile(context);

                  showSnackBar(context, "Order placed Successfully", Colors.lightGreen);

                  Navigator.pushNamed(context, "my-orders-screen");
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                ),
                child: Text(
                  "Buy Now",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}