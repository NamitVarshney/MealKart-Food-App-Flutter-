import 'package:flutter/material.dart';

import '../Settings/settings.dart';

class CustomNavigationBar extends StatefulWidget {
  final Function(int) currentSelectedItem;
  CustomNavigationBar({@required this.currentSelectedItem});
  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedItem,
      onTap: (currItem) {
        setState(() {
          selectedItem = currItem;
          widget.currentSelectedItem(currItem);
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: selectedItem == 0
                  ? MainColors.secondaryColor
                  : MainColors.blackColor,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Home',
              style: TextStyle(color: MainColors.blackColor),
            )),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: selectedItem == 1
                  ? MainColors.secondaryColor
                  : MainColors.blackColor,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Profile',
              style: TextStyle(color: MainColors.blackColor),
            )),
      /* BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_sharp,
              color: selectedItem == 2
                  ? MainColors.secondaryColor
                  : MainColors.blackColor,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Notification',
              style: TextStyle(color: MainColors.blackColor),
            )),
         BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_sharp,
              color: selectedItem == 3
                  ? MainColors.secondaryColor
                  : MainColors.blackColor,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Shopping Cart',
              style: TextStyle(color: MainColors.blackColor),
            )), */
      ],
    );
  }
}
