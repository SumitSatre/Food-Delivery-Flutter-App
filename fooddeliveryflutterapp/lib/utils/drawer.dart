// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final String name, email;
  const MyDrawer({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    const imageURL =
        "https://e0.pxfuel.com/wallpapers/900/942/desktop-wallpaper-cartoon-cartoon-new-cartoon-boy-cartoon-letest-cartoon-cute-cartoon-cute-bay-cartoon-kartoon-thumbnail.jpg";
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(padding: EdgeInsets.zero, children: [
          Container(
            color: Colors.brown,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.brown),
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.brown),
                margin: EdgeInsets.zero,
                accountName: Text(name),
                accountEmail: Text(email),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageURL),
                ),
              ),
            ),
          ),
          // ListTile(
          //   onTap: () {

          //    }   ,
          //   leading: Icon(
          //     CupertinoIcons.doc,
          //     color: Colors.black,
          //   ),
          //   title: Text(
          //     "My Application",
          //     textScaleFactor: 1.2,
          //     style:
          //         TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          //   ),
          // ),
          ListTile(
            onTap: () {

            }
                ,
            leading: Icon(
              CupertinoIcons.phone,
              color: Colors.black,
            ),
            title: Text(
              "Contact Us",
              textScaleFactor: 1.2,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.settings,
              color: Colors.black,
            ),
            title: Text(
              "Settings",
              textScaleFactor: 1.2,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),

          ListTile(
            onTap: () {},
            leading: Icon(
              CupertinoIcons.power,
              color: Colors.black,
            ),
            title: Text(
              "Log Out",
              textScaleFactor: 1.2,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          )
        ]),
      ),
    );
  }
}
