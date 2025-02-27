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
            style: Theme.of(context).textTheme.headline4,
          ),
          actions: [
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
            padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  CupertinoButton(
                    onPressed: () async {
                      // XFile? selectedImage = await ImagePicker().pickImage(
                      //   source: ImageSource.gallery,
                      // );
                      // if (selectedImage != null) {
                      //   File convertedFile = File(selectedImage.path);
                      //   setState(() {
                      //     profilePic = convertedFile;
                      //   });
                      //   debugPrint("Image selected");
                      // } else {
                      //   debugPrint("No image selected");
                      // }
                    },
                    padding: EdgeInsets.zero,
                    child: const CircleAvatar(
                      // backgroundImage:
                      //     (profilePic != null) ? FileImage(profilePic!) : null,
                      radius: 40,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: TextField(
                      // controller: nameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 5),
                        labelText: 'Full Name',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Enter your name',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: TextField(
                      // controller: emailController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 5),
                        labelText: 'Email',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: TextField(
                      // controller: mobileController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 5),
                        labelText: 'Phone Number',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Enter your phone number',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: TextField(
                      // controller: cityController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 5),
                        labelText: 'City',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Enter your city',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: TextField(
                      // controller: ageController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 5),
                        labelText: 'Age',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Enter your age',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'login');
                        },
                        child: const Text(
                          'CANCEL',
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.black,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // saveUser();
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => HomePageFinal(
                          //       name: nameController.text.trim(),
                          //       profilePic: profilePic,
                          //     ),
                          //   ),
                          // );
                        },
                        child: const Text(
                          'SAVE',
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          padding: const EdgeInsets.symmetric(horizontal: 50),
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
            ),
        );
    }
}
