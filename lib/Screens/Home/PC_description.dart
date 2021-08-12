import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Settings/settings.dart';
import 'package:fluttertoast/fluttertoast.dart';
class PeopleDescription extends StatefulWidget {
  static const rouName = "PCDescription";
  @override
  _PeopleDescriptionState createState() => _PeopleDescriptionState();
}

class _PeopleDescriptionState extends State<PeopleDescription> {
  favorites(itemName, user, currentFavorites) async {
    await Firestore.instance
        .collection('Favorites')
        .document(user.uid)
        .get()
        .then((favorites) async {
      if (favorites.data.containsKey(itemName)) {
        await Firestore.instance
            .collection('Favorites')
            .document(user.uid)
            .updateData({itemName: FieldValue.delete()}).then((_) {
          setState(() {
            currentFavorites.remove(itemName);
          });
        });
      } else {
        await Firestore.instance
            .collection('Favorites')
            .document(user.uid)
            .updateData({itemName: itemName}).then((_) {
          setState(() {
            currentFavorites.add(itemName);
          });
        });
      }
      print(currentFavorites);
    });
  }

  double paddingImage = 50;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        paddingImage = 25; 
      });
    });
    final List<dynamic> arguments = ModalRoute.of(context).settings.arguments;
    final itemName = arguments[0];
    final itemPrice = arguments[1];
    final itemURL = arguments[2];
    final FirebaseUser user = arguments[3];
    List<String> currentFavorites = arguments[4];
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(
                currentFavorites.contains(itemName)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.teal,
              ),
              onPressed: () {
                favorites(itemName, user, currentFavorites);
              }),
        ],
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('Back'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: AnimatedContainer(
                    padding: EdgeInsets.all(paddingImage),
                    child: ClipRRect(
                      child: Image.network(
                        itemURL,
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    duration: Duration(milliseconds: 500),
                  ),
                  flex: 2,
                ),
                //SizedBox(width: 10),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Restaurant'),
                    Text(
                      'Highway King',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    Text('Address'),
                    Text(
                      'Dehmi-Kalan, Jaipur',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    Text('Timings'),
                    Text(
                      '9AM-9PM',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    SizedBox(height: 20),
                    Text("Ratings",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      Icon(
                        Icons.star_border,
                        color: Colors.orange,
                      )
                    ],
                  )
                  ],
                ))
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        itemName,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      
                      Container(
                        height: 22,
                        width: 17,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/orangetick.jpg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Text("  "),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/pureVeg.jpg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Spacer(),
                      Text ('Rs '+itemPrice.toStringAsFixed(2),
                      style: TextStyle(
                          fontSize: 18, color: Colors.black)), 
                    ],
                  ),
                  //SizedBox(height: 10),
                  
                  SizedBox(height: 20),
                  Text(
                    'Kadahi Paneer+dal makhani+mixed veg+veg pulao+dahi bhalla+salad+hari chutney+2 lachcha paratha+papad+rasmalai [1 piece]',
                    style: TextStyle(color: Colors.teal),
                  ),
                  SizedBox(height: 10),
                  // Row(
                  //   children: [
                  //     Text(
                  //         ' '),
                  //         Spacer(),
                  // Container(
                  //       height: 40,
                  //       width: 60,
                  //       decoration: BoxDecoration(
                  //         image: DecorationImage(
                  //           image: AssetImage('assets/images/best_price.jpg'),
                  //           fit: BoxFit.fill,
                  //         ),
                  //         shape: BoxShape.rectangle,
                  //       ),
                  //     ),
                  //     Spacer(),
                  //   ],
                  // ),
                  //SizedBox(height: 10),
                  
                ],
              ),
            ),
            flex: 1,
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: RaisedButton(
          onPressed: () {Fluttertoast.showToast(
                msg: "Thanks for Ordering.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.teal,
                textColor: Colors.white);},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: MainColors.secondaryColor,
          child: Text(
            'ORDER NOW',
            style: TextStyle(color: MainColors.whiteColor),
          ),
        ),
      ),
    );
  }
}
