import 'package:flutter/material.dart';

import '../../Settings/settings.dart';

class LoginScreen extends StatefulWidget {
  final Function(String email, String password) createUser;
  final Function(String email, String password) signInUser;
  LoginScreen({
    @required this.createUser,
    @required this.signInUser,
  });
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

enum LoginOrRegister {
  login,
  register,
}

class _LoginScreenState extends State<LoginScreen> {
  LoginOrRegister loginOrRegister = LoginOrRegister.login;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String email;
  String password;
  bool hidePassword = true;

  List<Widget> buildTextField() {
    return [
      TextFormField(
        decoration: InputDecoration(
          hintText: 'Email',
          fillColor: MainColors.whiteColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onSaved: (value) => email = value,
        keyboardType: TextInputType.emailAddress,
      ),
      SizedBox(height: 10),
      TextFormField(
        decoration: InputDecoration(
            hintText: 'Password',
            fillColor: MainColors.whiteColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            suffixIcon: IconButton(
                icon: Icon(hidePassword == true ? Icons.lock : Icons.lock_open),
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                })),
        onSaved: (value) => password = value,
        obscureText: hidePassword,
      ),
      SizedBox(
        height: 20,
      )
    ];
  }

  List<Widget> buildWidgets() {
    if (loginOrRegister == LoginOrRegister.login) {
      return [
        CustomButton(
          text: 'SIGN IN',
          color: MainColors.secondaryColor,
          function: () {
            globalKey.currentState.save();
            widget.signInUser(email, password);
          },
          textColor: MainColors.blackColor,
        ),
        RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          elevation: 0,
          color: Colors.transparent,
          onPressed: () {
            setState(() {
              loginOrRegister = LoginOrRegister.register;
            });
          },
          child: Text('SIGN UP Instead',style:
                          TextStyle(color: Colors.black87),),
        )
      ];
    } else {
      return [
        CustomButton(
            text: 'SIGN UP',
            color: MainColors.secondaryColor,
            function: () {
              globalKey.currentState.save();
              widget.createUser(email, password);
            },
            textColor: MainColors.blackColor),
        RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          elevation: 0,
          color: Colors.transparent,
          onPressed: () {
            setState(() {
              loginOrRegister = LoginOrRegister.login;
            });
          },
          child: Text('SIGN IN Instead', style:
                          TextStyle(color: Colors.black87),),
        )
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color(0xff885566),
        
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'MealKart',
          style: TextStyle(
              color: Colors.orange, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new NetworkImage(
                        'https://images.pexels.com/photos/7135050/pexels-photo-7135050.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'))),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, bottom: 100, top: 40, right: 20),
                child: Form(
                  key: globalKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: buildTextField() + buildWidgets(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
