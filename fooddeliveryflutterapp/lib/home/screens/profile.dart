import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryflutterapp/home/controllers/home_controller.dart';
import 'package:fooddeliveryflutterapp/utils/services/shared_preferences_service.dart';
import 'package:fooddeliveryflutterapp/utils/snackBar.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  // File? profilePic;

  bool isObscurePassword = true;

  @override
  Widget build(BuildContext context) {

    final controller = Provider.of<HomeProvider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.lightBlue,
          elevation: 0, // Remove app bar shadow
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.logout), // You should use the appropriate logout icon
              onPressed: () {
                SharedPreferenceService().checkLogin();
                showSnackBar(context, "Logout Successfully", Colors.green);

                Navigator.pushNamed(context, "login");
              },
            ),
          ],
        ),

        body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  // Add image selection logic here
                },
                child: CircleAvatar(
                  // backgroundImage:
                  //     (profilePic != null) ? FileImage(profilePic!) : null,
                  radius: 60,
                  backgroundColor: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 20),
            buildTextField(
              controller: nameController,
              label: 'Full Name',
              hint: 'Enter your name',
                onChanged: (val){
                  controller.updateUserName(val);
                }
            ),
            buildTextField(
              controller: emailController,
              label: 'Contact Number',
              hint: 'Enter your Contact Number',
                onChanged: (val){
                  controller.updateUserPhoneNumber(val);
                }
            ),
            buildTextField(
              controller: cityController,
              label: 'City',
              hint: 'Enter your city',
              onChanged: (val){
                controller.updateUserCity(val);
              }
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add cancel logic here
                  },
                  child: Text(
                    'CANCEL',
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 2,
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.updateProfile(context);
                    showSnackBar(context, "Profile updated successfully", Colors.green);
                  },
                  child: Text(
                    'SAVE',
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 2,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required void Function(String)? onChanged
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.lightBlue,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.lightBlue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.lightBlue),
          ),
        ),
      ),
    );
  }
}
