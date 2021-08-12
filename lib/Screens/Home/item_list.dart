import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../Settings/settings.dart';
import 'item_list_widget.dart';

class ItemList extends StatefulWidget {
  final FirebaseUser user;
  ItemList({@required this.user});
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  futureBuilder() async {
    currentFavorites = [];
    await Firestore.instance
        .collection('Favorites')
        .document(widget.user.uid)
        .get()
        .then((favorites) {
      favorites.data.forEach((key, value) {
        currentFavorites.add(key);
      });
      print(favorites.data);
    });
  }

  List<String> currentFavorites = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureBuilder(),
      builder: (BuildContext futureContext, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(MainColors.secondaryColor),
              ))
            : ItemListWidget(
                user: widget.user,
                currentFav: currentFavorites,
              );
      },
    );
  }
}
