import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:websitesticker/const/consts.dart';

class FirestoreServices{

  static getUser(uid){
    return firestore.collection(usersCollection)
    .where('id' ,isEqualTo: uid)
    .snapshots();
  }
  static getUserForLogin(email){
    return firestore.collection(usersCollection).where('email',isEqualTo: email).snapshots();
  }
  static getcart(uid){
    return firestore.collection(cartCollection)
        .where('added_by',isEqualTo: uid)
        .snapshots();
  }
 static deletedocument(docId){
    return firestore.collection(cartCollection).doc(docId).delete();
  }

  static getorders(uid){
    return firestore.collection(orderCollections)
        .where('order_by',isEqualTo: uid)
        .snapshots();
  }

  static getproducts(category){
    return firestore.collection(productCollection)
        .where('p_category',isEqualTo: category).snapshots();
  }
  static getParticularproducts(category,subcategory){
    return firestore.collection(productCollection)
        .where('p_category',isEqualTo: category).where('p_subcategory',isEqualTo: subcategory).snapshots();
  }

  static getChatmessages(docId){
    return firestore.collection(chatCollection).doc(docId).collection(messageCollection)
        .orderBy('created_on',descending: false)
        .snapshots();
  }
  static getWishlist(){
    return firestore.collection(productCollection).where('p_wishlist',arrayContains: 
    currentUser!.uid);
  }
  static getAllmessages(){
    return firestore.collection(chatCollection).where('fromId',isEqualTo:currentUser!.uid)
        .snapshots();
  }
  static getCounts()async{
    var res=Future.wait([
      firestore.collection(cartCollection).where('added_by',isEqualTo: currentUser!.uid).get().then((value){
       return value.docs.length;
      }),
    firestore.collection(productCollection).where('p_wishlist',arrayContains:
    currentUser!.uid).get().then((value){
        return value.docs.length;
      }),
      firestore.collection(orderCollections).where('order_by',isEqualTo: currentUser!.uid).get().then((value){
        return value.docs.length;
      }),
    ]);
    return res;
  }

  static getallProducts(){
    return firestore.collection(productCollection).snapshots();
  }
  static getFeaturedproducts(){
    return firestore.collection(productCollection).where('is_featured',isEqualTo: true).snapshots();
  }
  

}