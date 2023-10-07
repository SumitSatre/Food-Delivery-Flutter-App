import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryflutterapp/home/model/household_products_model.dart';

class HouseHoldDetailPage extends StatefulWidget {
  @override
  _HouseHoldDetailPageState createState() => _HouseHoldDetailPageState();
}

class _HouseHoldDetailPageState extends State<HouseHoldDetailPage> {

  @override

  Widget build(BuildContext context) {
    final HouseHoldProductModel? restaurantData = ModalRoute.of(context)!.settings.arguments as HouseHoldProductModel?;
    return Scaffold(
      appBar: AppBar(
        title: Text('HouseHold Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                restaurantData?.photos?[0] ?? "https://source.unsplash.com/random/900x700/?food", // Use the first photo URL
                width: 200,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              restaurantData?.householdName ?? "",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              restaurantData?.location ?? "",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'About Us',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              restaurantData?.about ?? "",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Pricing',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 200, // Specify a fixed height
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: restaurantData!.pricing?.cuisines?.length ?? 0,
                itemBuilder: (context, index) {
                  final cuisine = restaurantData!.pricing?.cuisines?[index];
                  return ListTile(
                    title: Text(
                      cuisine?.cuisineName ?? "Not Specified",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '\$${cuisine?.price ?? "-"}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Dishes',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 200, // Specify a fixed height
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: restaurantData!.pricing?.dishes?.length ?? 0,
                itemBuilder: (context, index) {
                  final dish = restaurantData!.pricing?.dishes?[index];
                  return ListTile(
                    title: Text(
                      dish?.dishName ?? "Not Specified",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '\$${dish?.price ?? "-"}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
