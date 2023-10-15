import 'package:flutter/material.dart';
import 'package:fooddeliveryflutterapp/home/controllers/home_controller.dart';
import 'package:fooddeliveryflutterapp/home/screens/cart/CartItem.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int calculateTotalPrice(List<dynamic> cartItems) {
    var totalPrice = 0;

    cartItems.forEach((item) {
      int price = item["price"] * (item["quantity"] ?? 0);
      totalPrice = totalPrice + price;
    });

    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView.builder(
          itemCount: controller.userModel!.myCart.length ?? 0,
          itemBuilder: (context, index) {
            return CartItemPage(
              cartItem: controller.userModel!.myCart[index],
            );
          },
        ),
      ),
      bottomNavigationBar: Row(
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
                "${"1600"}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Container(
            width: 170,
            child: ElevatedButton(
              onPressed: () {
                // Your Buy Now logic here
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
    );
  }
}
