import 'package:flutter/material.dart';

class HouseHoldDetailPage extends StatelessWidget {
  const HouseHoldDetailPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const Text('Restaurant Name'),
        ),
        body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // Make content full width
              children: [
                // Restaurant Image and Information
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/restaurant_image.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Welcome to Restaurant Name',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Search Bar
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search for dishes...',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),

                // Categories
                Container(
                  height: 100,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.pink.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(right: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                IconList[index],
                                width: 30,
                                color: Colors.teal.shade300,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                IconTitleList[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Popular Dishes
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Popular Dishes',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 200,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.redAccent.shade100,
                                ),
                                margin: const EdgeInsets.only(right: 16),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 120,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.yellow.shade50,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                        ),
                                      ),
                                      child: Image.asset(
                                        'assets/dish_image.png',
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      'Dish Name',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      '\$10.99',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // Scrollable List of Items with Buttons
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Menu',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Scrollable list of items with names, prices, and buttons
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10, // Replace with the number of items
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Item Name $index',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const Text(
                                  '\$10.99',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        // Implement logic to add an item here
                                      },
                                      icon: const Icon(Icons.add),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        // Implement logic to remove an item here
                                      },
                                      icon: const Icon(Icons.remove),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
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

class AppAssets {
  static String item1 = "assets/icons/rice.png",
      item2 = "assets/icons/pizza.png",
      item3 = "assets/icons/burger.png",
      item4 = "assets/icons/chicken.png",
      item5 = "assets/icons/dosa.png",
      item7 = "assets/icons/roti.png",
      item6= "assets/icons/beverages.png",
      item8 = "assets/icons/cocacola.png",
      item9 = "assets/icons/iutr.png";
}

class AppString {
  static String item1 = "biryani",
      item2 = 'burger',
      item3 = 'pizza',
      item4 = 'dosa',
      item5 = 'idli',
      item6 = 'roti',
      item7= 'nan',
      item8 = 'biryani',
      item9='pepsi';
}


var IconList = [
  AppAssets.item1,
  AppAssets.item2,
  AppAssets.item3,
  AppAssets.item4,
  AppAssets.item5,
  AppAssets.item6,
  AppAssets.item7,
  AppAssets.item8,
  AppAssets.item9
];
var IconTitleList = [
  AppString.item1,
  AppString.item2,
  AppString.item3,
  AppString.item4,
  AppString.item5,
  AppString.item6,
  AppString.item7,
  AppString.item8,
  AppString.item9
];