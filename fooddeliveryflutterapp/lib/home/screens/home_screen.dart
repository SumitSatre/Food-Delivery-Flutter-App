import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryflutterapp/home/controllers/home_controller.dart';
import 'package:fooddeliveryflutterapp/home/screens/cart/cart_screen.dart';
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


  List<String> crouselImages = [
    "https://images.unsplash.com/photo-1467003909585-2f8a72700288?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=700&ixid=MnwxfDB8MXxyYW5kb218MHx8Zm9vZHx8fHx8fDE2OTY2NzA5MjI&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=900",
    "https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=700&ixid=MnwxfDB8MXxyYW5kb218MHx8Zm9vZHx8fHx8fDE2OTY2NzA3NDc&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=900",
    "https://images.unsplash.com/photo-1586190848861-99aa4a171e90?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=700&ixid=MnwxfDB8MXxyYW5kb218MHx8Zm9vZHx8fHx8fDE2OTY2NzA3Njg&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=900",
    "https://images.unsplash.com/photo-1475090169767-40ed8d18f67d?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=700&ixid=MnwxfDB8MXxyYW5kb218MHx8Zm9vZHx8fHx8fDE2OTY2NzA4MzQ&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=900",
  ];

  List<Color> bgColor = [
    const Color(0xFFFBDCDA),
    const Color(0xFFD4EEF3),
    const Color(0xFFFAE6D5),
    const Color(0xFFEFCFE7),
  ];

  @override
  Widget build(BuildContext context) {

    final controller = Provider.of<HomeProvider>(context, listen: false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                              children:  [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.redAccent,
                                ),
                                Text(
                                  controller.userModel?.address?.city ?? "",
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
                            ),
                          ],
                        ),

                        Row(
                          children: [

                            Stack(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    // image: const DecorationImage(
                                    //     image: AssetImage("images/ouieiek.jpg"),
                                    //     fit: BoxFit.cover)
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.pushNamed(context, "my-orders-screen");
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(5),
                                      padding: const EdgeInsets.all(5),
                                      child: Icon(Icons.shopping_bag),
                                    ),
                                  ),
                                ),

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
                                    // image: const DecorationImage(
                                    //     image: AssetImage("images/ouieiek.jpg"),
                                    //     fit: BoxFit.cover)
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.pushNamed(context, "profile");
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(5),
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey, width: 1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(Icons.person),
                                    ),
                                  ),
                                ),

                              ],
                            )
                          ],
                        ),
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
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: CarouselSlider(
                        items: crouselImages.map((item) {
                          return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(2)),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(2),
                                            child: Image.network(
                                              item,
                                              fit: BoxFit.cover,
                                              height: 250,
                                              width: 300,
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }).toList(),
                        options: CarouselOptions(
                            height: 220,
                            aspectRatio: 16 / 9,
                            viewportFraction: 1,
                            autoPlay: true,
                            enlargeCenterPage: false
                          // enableInfiniteScroll:false
                        )),
                  ),

                  const SizedBox(
                    height: 20,
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
                      ],
                    ),
                  ),

                  FutureBuilder(
                    future: controller.getHouseHoldFoodProducts(),
                      builder: (context , snapshot){

                        if(snapshot.connectionState == ConnectionState.waiting){
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        else if(controller.isError){
                          return Center(
                            child: Text("Something got wrong!!"),
                          );
                        }

                        else if(controller.isDataFetched){
                          return SizedBox(
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: controller.houseHoldFoodsProducts!.length ,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, "house-hold-details-page" , arguments: controller.houseHoldFoodsProducts![index]) ;
                                  },
                                  child: Container(
                                    height: 250,
                                    width: MediaQuery.of(context).size.width / 1.4,
                                    margin: const EdgeInsets.only(
                                        left: 20, top: 5, bottom: 15, right: 20),
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
                                          child: Image.network(
                                            controller.houseHoldFoodsProducts?[index]?.photos?.isNotEmpty == true
                                                ? controller.houseHoldFoodsProducts![index]!.photos![0] ?? ""
                                                : "https://source.unsplash.com/random/900x700/?food",
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
                                                    controller.houseHoldFoodsProducts?[index]?.householdName ?? "",
                                                    style: const TextStyle(
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    controller.houseHoldFoodsProducts?[index]?.location ?? "",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black45,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children:  [
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.redAccent,
                                                        size: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 2,
                                                      ),
                                                      Text(
                                                        controller.houseHoldFoodsProducts?[index]?.rating.toString() ?? "",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
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
                                                      children: [
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
                          );
                        }

                        else{
                          return Center(
                            child: Text("Something error"),
                          );
                        }
                      }
                  )

                ],
              ),
              ),
      ),

      floatingActionButton: Container(
        width: 60, // Set the width and height to make it circular
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
              spreadRadius: 1.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "cart-screen");
          },
          child: Icon(
            Icons.shopping_cart,
            size: 30, // Adjust the icon size as needed
          ),
        ),
      )
    );
    }
}
