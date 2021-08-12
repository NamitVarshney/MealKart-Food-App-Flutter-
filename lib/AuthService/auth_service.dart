import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AuthAction {
  Future<FirebaseUser> currentUser();
  Future<FirebaseUser> logOut();
  Future<FirebaseUser> createUser(email, password);
  Future<FirebaseUser> signInUser(email, password);
}

class AuthService implements AuthAction {
  FirebaseUser user;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> currentUser() async {
    try {
      user = await firebaseAuth.currentUser();
    } catch (e) {
      print(e);
    }
    return user;
  }

  Future<FirebaseUser> createUser(email, password) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((currUser) {
        user = currUser.user;
      }).then((_) {
        Firestore.instance
            .collection('Favorites')
            .document(user.uid)
            .setData({});
      });
    } catch (e) {
      print(e);
    }
    return user;
  }

  Future<FirebaseUser> signInUser(email, password) async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((currUser) {
        user = currUser.user;
      });
    } catch (e) {
      print(e);
    }
    return user;
  }

  Future<FirebaseUser> logOut() async {
    try {
      await firebaseAuth.signOut();
      user = null;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
