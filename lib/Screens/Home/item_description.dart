import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Settings/settings.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ItemDescription extends StatefulWidget {
  static const routeName = "/item-description";
  @override
  _ItemDescriptionState createState() => _ItemDescriptionState();
}

class _ItemDescriptionState extends State<ItemDescription> {
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
        paddingImage = 30;
      });
    });
    final List<dynamic> arguments = ModalRoute.of(context).settings.arguments;
    final itemName = arguments[0];
    final itemPrice = arguments[1];
    final itemURL = arguments[2];
    //final addressName = arguments[4];
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
                    padding: EdgeInsets.all(25),
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
                //Spacer(),
                // SizedBox(width: 1 ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Address'),
                    Text(
                      'Ashok Nagar, Delhi',
                      //addressName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    Text('Call Us'),
                    Text(
                      '7965485168',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text('Timing'),
                    Text(
                      '8AM-10PM',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Rating',
                      style: TextStyle(fontSize: 16),
                    ),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
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
                      Text("      "),
                      RaisedButton(
                        onPressed: () {
                          Fluttertoast.showToast(
                              msg: "1.Raj Kachori\n2. Shahi Paneer\n3. Chole Bhature\n4. Dal Makhani\n5. Malai Chaap\n6. Veg Thali\n7. Pizza\n8. Ice Cream\n9. Sandwiches\n10. Dosa",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.teal,
                              textColor: Colors.white);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        color: MainColors.secondaryColor,
                        child: Text(
                          'CheckOut Menu',
                          style: TextStyle(color: MainColors.whiteColor),
                        ),
                      ),
                    ],
                  ),

                  //SizedBox(height: 10),
                  // Text('' + itemPrice.toStringAsFixed(2),
                  //     style: TextStyle(fontSize: 12, color: Colors.teal)),
                  // SizedBox(height: 10),
                  Text(
                    'Our mission is to give our customers a place to celebrate life’s special moments by offering the best food, service, and ambiance in Delhi.',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.teal),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Cuisines',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        '                          Services & Amenities',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                          '1. Chinese\n2. South Indian\n3. North Indian\n4. Street Food\n5. Mexican\n6. Italian\n7. Continental'),
                      Spacer(),
                      Text(
                          '               1. Home Delivery\n               2. e-Wallets Accepted\n               3. Outdoor Seating\n               4. Parking Available\n\n\n'),
                      Spacer(),
                    ],
                  ),

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
          onPressed: () {
            Fluttertoast.showToast(
                msg: "Your Seat has Been Booked.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.teal,
                textColor: Colors.white);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: MainColors.secondaryColor,
          child: Text(
            'Book Your Seat Today',
            style: TextStyle(color: MainColors.whiteColor),
          ),
        ),
      ),
    );
  }
}
