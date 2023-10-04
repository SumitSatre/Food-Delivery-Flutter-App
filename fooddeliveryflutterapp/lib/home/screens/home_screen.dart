import 'package:flutter/material.dart';
import 'package:fooddeliveryflutterapp/home/controllers/home_controller.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    callInit();
  }

  void callInit() {
    Provider.of<HomeProvider>(context, listen: false).init();
  }

  List foods = [
    "Burger",
    "Pizza",
    "Snacks",
    "Water",
  ];

  List foods2 = [
    "Chicken Burger",
    "Cheese Pizza",
  ];

  List<Color> bgColor = [
    const Color(0xFFFBDCDA),
    const Color(0xFFD4EEF3),
    const Color(0xFFFAE6D5),
    const Color(0xFFEFCFE7),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Deliver to",
                            style: TextStyle(fontSize: 18, color: Colors.black54),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.location_on,
                                color: Colors.redAccent,
                              ),
                              Text(
                                "New Delhi India",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.redAccent,
                              )
                            ],
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(
                                    image: AssetImage("images/ouieiek.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                          Positioned(
                            left: 40,
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 3),
                                color: Colors.redAccent,
                                shape: BoxShape.circle,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.4,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Search your Food here..",
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.filter_list,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset("images/offer.jpeg"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "See All",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: foods.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100,
                        margin: const EdgeInsets.only(left: 15),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: bgColor[index],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "images/${foods[index]}.png",
                              height: 80,
                              width: 80,
                            ),
                            Text(
                              foods[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    children: [
                      const Text(
                        "Popular",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "See All",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: foods2.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          margin: const EdgeInsets.only(
                              left: 15, top: 5, bottom: 5, right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Image.asset(
                                  "images/${foods2[index]}.jpg",
                                  height: 120,
                                  width: MediaQuery.of(context).size.width / 1.4,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          foods2[index],
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          "Fast Food",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black45,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: const [
                                            Icon(
                                              Icons.star,
                                              color: Colors.redAccent,
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text(
                                              "4.7",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "(941 Rating)",
                                              style: TextStyle(
                                                color: Colors.black45,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(padding: const EdgeInsets.all(8),
                                          child: Row(
                                            children: const [
                                              Icon(
                                                Icons.location_on,
                                                color: Colors.redAccent,
                                                size: 20,
                                              ),
                                              SizedBox(width: 2,),
                                              Text(
                                                "1 Km",
                                                style: TextStyle(
                                                  color: Colors.black45,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 10,),
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: const BoxDecoration(
                                              color: Colors.redAccent,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                              )
                                          ),
                                          child: const Text(
                                            "\$15.89",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),

                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            ),
        );
    }
}