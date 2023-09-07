import 'package:websitesticker/const/consts.dart';

class ClientServices{

  static getprofile(uid){
  return firestore.collection(usersCollection).doc(uid).get();
  }

  static getmessage(uid){
    return firestore.collection(chatCollection).where('toId',isEqualTo: uid).snapshots();
  }

  static getorders(uid){
    return firestore.collection(orderCollections).where('vendors',arrayContains: uid).snapshots();
  }

  static getproducts(uid){
    return firestore.collection(productCollection).where('seller_id',isEqualTo: uid).snapshots();
  }

  static getUser(uid){
    return firestore.collection(usersCollection)
        .where('id' ,isEqualTo: uid)
        .snapshots();
  }

  static getChatmessages(docId){
    return firestore.collection(chatCollection).doc(docId).collection(messageCollection)
        .orderBy('created_on',descending: false)
        .snapshots();
  }
}