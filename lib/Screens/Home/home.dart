import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/Settings/settings.dart';

import 'item_list.dart';
import '../../CustomBottomBar/custom_navigation_bar.dart';
import 'profile.dart';

class HomeScreen extends StatefulWidget {
  final Function logOut;
  final FirebaseUser user;
  HomeScreen({@required this.logOut, @required this.user});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MealKart',  style: TextStyle(color: Colors.orange , fontSize: 26, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: MainColors.whiteColor,
        elevation: 0,
      ),
      body: currentItem == 1
          ? ProfileScreen(
              logout: () {
                widget.logOut();
              },
              user: widget.user
            )
          : ItemList(user: widget.user),
      bottomNavigationBar: CustomNavigationBar(
        currentSelectedItem: (value) {
          setState(() {
            currentItem = value;
          });
        },
      ),
    );
  }
}
