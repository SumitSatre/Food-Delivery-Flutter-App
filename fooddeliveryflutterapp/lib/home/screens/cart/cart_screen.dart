import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.only(
                  top: 20,
                  left: 10,
                  bottom: 10
                ),
                child: Text("Order List",
                style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold),
                ),
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 9),
                child: Container(
                  width: 380,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                   boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 3)

                    )
                   ]
                               ),
                               child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: Image.asset("asset/pizza.png",
                                    height: 80,
                                    width: 150,),
                                  ),
                                  Container(
                                    width: 190,
                                    child: Column(
                                      children: const [
                                        Text(
                                          "Hot Pizza",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                          Text(
                                          "Taste the thinder",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                          Text(
                                          "\$10",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(padding: const EdgeInsets.symmetric(vertical: 10, ),
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),

                                    ),
                                    child: Column(
                                      children: const [
                                        Icon(
                                          CupertinoIcons.minus,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "2",
                                          style: TextStyle(fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                        ),
                                         Icon(
                                          CupertinoIcons.minus,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  )
                                ],
                               ),
                ),
                ),
                    Padding(padding: const EdgeInsets.symmetric(vertical: 9),
                child: Container(
                  width: 380,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                   boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 3)

                    )
                   ]
                               ),
                               child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: Image.asset("asset/pizza.png",
                                    height: 80,
                                    width: 150,),
                                  ),
                                  Container(
                                    width: 190,
                                    child: Column(
                                      children: const [
                                        Text(
                                          "Hot Burger",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                          Text(
                                          "Taste the laziz",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                          Text(
                                          "\$10",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(padding: const EdgeInsets.symmetric(vertical: 10, ),
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),

                                    ),
                                    child: Column(
                                      children: const [
                                        Icon(
                                          CupertinoIcons.minus,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "2",
                                          style: TextStyle(fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                        ),
                                         Icon(
                                          CupertinoIcons.minus,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  )
                                ],
                               ),
                ),
                ),
                    Padding(padding: const EdgeInsets.symmetric(vertical: 9),
                child: Container(
                  width: 380,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                   boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 3)

                    )
                   ]
                               ),
                               child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: Image.asset("asset/pizza.png",
                                    height: 80,
                                    width: 150,),
                                  ),
                                  Container(
                                    width: 190,
                                    child: Column(
                                      children: const [
                                        Text(
                                          "chicken",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                          Text(
                                          "Taste the chicken",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                          Text(
                                          "\$10",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(padding: const EdgeInsets.symmetric(vertical: 10, ),
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),

                                    ),
                                    child: Column(
                                      children: const [
                                        Icon(
                                          CupertinoIcons.minus,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "2",
                                          style: TextStyle(fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                        ),
                                         Icon(
                                          CupertinoIcons.minus,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  )
                                ],
                               ),
                ),
                ),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical:30 ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 3)
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      Padding(padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,

                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            )
                          ]
                        ),
                        child: Column(
                          children: [
                            Padding(padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: const [
                                Text(
                                  "Items",
                                  style: TextStyle(fontSize: 20),
                                ),
                                 Text(
                                  "10",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                               Padding(padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: const [
                                Text(
                                  "Subtotal",
                                  style: TextStyle(fontSize: 20),
                                ),
                                 Text(
                                  "\$60",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            ),
                              const Divider(
                              color: Colors.black,
                            ),
                               Padding(padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: const [
                                Text(
                                  "Delivery",
                                  style: TextStyle(fontSize: 20),
                                ),
                                 Text(
                                  "\$20",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            ),
                              const Divider(
                              color: Colors.black,
                            ),
                               Padding(padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: const [
                                Text(
                                  "Total",
                                  style: TextStyle(fontSize: 20,
                                  fontWeight: FontWeight.bold),
                                ),
                                 Text(
                                  "\$80",
                                  style: TextStyle(fontSize: 20,
                                  color: Colors.red),
                                ),
                              ],
                            ),
                            ),
                          ],
                        ),
                      ),
                      )
                    ],
                  ),
                ),
                )
              ],
            ),
            ),
          )
        ],
      ),
);
}
}

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Text(
                  "Total",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "\$80",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                )
              ],
            ),
            ElevatedButton(onPressed: (){},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                )
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              )
            ),
            child: const Text("Order Now",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),),)
          ],
        ),
     ),
);
}
}