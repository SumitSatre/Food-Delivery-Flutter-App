
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryflutterapp/home/controllers/home_controller.dart';
import 'package:fooddeliveryflutterapp/home/model/household_products_model.dart';
import 'package:fooddeliveryflutterapp/utils/snackBar.dart';
import 'package:provider/provider.dart';

class DishCard extends StatefulWidget {
  final Dish dish;


  DishCard({required this.dish});

  @override
  State<DishCard> createState() => _DishCardState();
}

class _DishCardState extends State<DishCard> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeProvider>(context, listen: false);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity, // Take up the full width
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                width: 150,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.dish.image),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10), // Add spacing between the image and text
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.dish.dishName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "₹${widget.dish.price.toString()}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                            if(quantity >= 1){
                              quantity--;
                            }
                            setState(() {

                            });
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Text(
                        quantity.toString(),
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          quantity++;
                          setState(() {

                          });
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: (){
                      if(quantity != 0){
                        controller.addItemInCart(widget.dish, quantity);
                        controller.updateProfile(context);
                        showSnackBar(context, "Item Added Successfully", Colors.lightGreen);
                      }
                    },
                    child: Container(
                      width: 120,
                      height: 30,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.shopping_cart,
                            size: 15,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Add to Cart",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: <Widget>[
                      Text(
                        "Ratings",
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(width: 10),
                      Row(
                        children: List.generate(
                          4,
                              (index) => Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.orangeAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
