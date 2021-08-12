import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Settings/settings.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Description extends StatefulWidget {
  static const dir = "description";
  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
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
    //final itemPrice = arguments[1];
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
                //SizedBox(width: 0),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Lockdown Timings'),
                    Text(
                      '7:00 - 10:00 AM',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(height: 10),
                    Text('Home Delivery Call'),
                    Text(
                      '9802365748',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text('Avaliability'),
                    Text(
                      '* Grocery',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      '* OTC Medicines',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.5),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Rating',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
              padding: const EdgeInsets.all(13.0),
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
                      Spacer(),
                      Container(
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/licensed.jpg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  /* Text('\$ ' + itemPrice.toStringAsFixed(2),
                      style: TextStyle(
                          fontSize: 20, color: Colors.teal)), */
                  // SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        'Covid Prevention\nSupplies',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        "           Lockdown Essential\n           Groceries",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                          '1. Sanitizers\n2. Face Shields\n3. Masks & Glooves\n4. Govt aprvd PPE Kits\n5. OTC Medicines\n\n'),
                      Spacer(),
                      Text(
                          '1. Fresh Dairy Products\n2. All Fruits & Vegetables\n3. Floor\n4. Cereals\n5. Rice\n6. Sugar \n7. Edible oil'),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 35,
                    child: Container(
                      height: 300,
                      width: 400,
                      color: Colors.teal,
                      child: Text(
                          "Only 100 Booking per day as per First-Come, First-Server Basis.", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              ),
            ),
            flex: 1,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: RaisedButton(
          onPressed: () {
            Fluttertoast.showToast(
                msg: "Your Presence has been Reserved.",
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
            'Book your Shopping Day.',
            style: TextStyle(color: MainColors.whiteColor),
          ),
        ),
      ),
    );
  }
}
