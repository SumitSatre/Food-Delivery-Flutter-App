import 'package:flutter/material.dart';
import 'package:fooddeliveryflutterapp/home/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:fooddeliveryflutterapp/home/controllers/home_controller.dart';
import 'package:fooddeliveryflutterapp/home/model/household_products_model.dart';
import 'package:fooddeliveryflutterapp/home/screens/household%20details/dish_card.dart';
import 'package:provider/provider.dart';

class CartItemPage extends StatefulWidget {
  CartItem cartItem ;

  CartItemPage({required this.cartItem});

  @override
  State<CartItemPage> createState() => _CartItemPageState();
}

class _CartItemPageState extends State<CartItemPage> {


  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<HomeProvider>(context).userModel!;

    final controller = Provider.of<HomeProvider>(context, listen: false);

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
                image: NetworkImage(widget.cartItem.image),
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
                  widget.cartItem.dishName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "\₹${widget.cartItem.price * widget.cartItem.quantity}",
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
                      widget.cartItem.householdName,
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

                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text(
                      "${widget.cartItem.quantity}",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        // setState(() {
                        //   widget.updateCartItem!(widget.cartItem["id"] , widget.cartItem["price"] , 1);
                        // });
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
              controller.removeItemInCart(widget.cartItem);
              controller.updateProfile(context);
              print(userModel.id);
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
}
