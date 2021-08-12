import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Settings/settings.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileScreen extends StatelessWidget {
  final Function logout;
  final FirebaseUser user;
  ProfileScreen({@required this.logout, @required this.user});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            height: 87.0,
            width: 82.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/profile.jpg'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.circle,
            ),
            /* margin: EdgeInsets.all(15),
            height: 90,
            width: 90,
            child: ClipOval(
              child: Image.network(
                'https://images.pexels.com/photos/4580147/pexels-photo-4580147.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                fit: BoxFit.cover,
              ),
            ), */
          ),
          SizedBox(
            height: 10,
          ),
          Row(children: [
            Spacer(),
            Spacer(),
            Spacer(),
            Spacer(),
            Spacer(),
            Text(
              " Login ID: ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
              user.email,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Spacer(),
            Spacer(),
            Spacer(),
            Spacer(),
          ]),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Spacer(),
              Spacer(),
              Spacer(),
              Text(
                "Address: Delhi, IN",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Spacer(),
              Spacer(),
              Spacer(),
              Spacer(),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          RaisedButton(
            splashColor: MainColors.secondaryColor,
            elevation: 0,
            color: Colors.transparent,
            onPressed: () {
              Fluttertoast.showToast(
                  msg:
                      "Credit Card: xxxx xxxx xxxx 8975\nDebit Card: xxxx xxxx xxxx 9874\n   UPI: " +
                          user.email +
                          "@oksbi\n     Paytm: 8648956795\nPhonePay: 8974652315",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.teal,
                  textColor: Colors.white);
            },
            child: Align(
              child: Text('Payment method'),
              alignment: Alignment.centerLeft,
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1.5,
          ),
          RaisedButton(
            splashColor: MainColors.secondaryColor,
            elevation: 0,
            color: Colors.transparent,
            onPressed: () {Fluttertoast.showToast(
                  msg:
                      "Share it on:\n1. Whatsapp.\n2. Telegram.\n3. Facebook.\n",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.teal,
                  textColor: Colors.white);},
            child: Align(
              child: Text('Invite Friends'),
              alignment: Alignment.centerLeft,
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1.5,
          ),
          RaisedButton(
            splashColor: MainColors.secondaryColor,
            elevation: 0,
            color: Colors.transparent,
            onPressed: () {Fluttertoast.showToast(
                  msg:
                      "CHANGE\n1. Your Profile Photo.\n2. Your Password.\n3. Payment method.\n4. Your Address.\n5. Layout",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.teal,
                  textColor: Colors.white);},
            child: Align(
              child: Text('Settings'),
              alignment: Alignment.centerLeft,
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1.5,
          ),
          RaisedButton(
            splashColor: MainColors.secondaryColor,
            elevation: 0,
            color: Colors.transparent,
            onPressed: () {
              logout();
            },
            child: Align(
              child: Text('Log out'),
              alignment: Alignment.centerLeft,
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
