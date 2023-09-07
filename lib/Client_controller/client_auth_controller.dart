
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/consts.dart';
import '../const/firebase_const.dart';
import '../login_screen.dart';

class ClientAuthController extends GetxController {

  var isloading = false.obs;
  var ischeck = false.obs;

  var isSeller = false.obs;

  var identifier_seller = "Seller_info";
  var user_email = "UserEmail";

  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();


  final FirebaseAuth _auth = FirebaseAuth.instance;


  //
  // Future<void> setSellerRole(User user) async {
  //   await user.getIdToken(true);
  //   await _auth.setCustomUserClaims(user.uid, {'seller': true});
  // }


  //login

  Future<UserCredential?> loginMethod(context) async {
    UserCredential? userCredential;
    try {
      userCredential =
      await auth.signInWithEmailAndPassword(
          email: emailcontroller.text, password: passcontroller.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //signup
  Future<UserCredential?> signupMethod(email, password, context) async {
    UserCredential? userCredential;
    try {
      userCredential =
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //storingdata
  storeUserDats(String? name, String? password, String? email) async {
    DocumentReference store = firestore.collection(usersCollection).doc(
        currentUser!.uid);
    store.set(
        { 'name': name,
          'password': password,
          'email': email,
          'imageUrl': '',
          'id': currentUser!.uid,
          'cart_count': "00",
          'wishlist_count': "00",
          'order_count': "00",

        }
    );
  }

  //storeSellerData
  storeSellerData(String? name, String? password, String? email) async {
    DocumentReference store = firestore.collection(sellerCollection).doc(
        currentUser!.uid);
    store.set(
        { 'name': name,
          'password': password,
          'email': email,
          'imageUrl': '',
          'id': currentUser!.uid,



        }
    );
  }

  //signout
  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      //xToast.show(context, msg: e.toString());
      print(e.toString());
    }
  }
}