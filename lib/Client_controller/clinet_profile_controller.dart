import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:websitesticker/const/consts.dart';

class ClientProfileController extends GetxController{
  late QueryDocumentSnapshot snapshot;


   var isLoading=false.obs;
  var shopnameController=TextEditingController();
  var shopaddressController=TextEditingController();
  var shopmobileNumberController=TextEditingController();
  var shopUpiIdController=TextEditingController();
  var shopDescrController=TextEditingController();

  updateShop(shopname,shopaddress,shopUpiId,shopphoneNumber)async{
    var store=await firestore.collection(usersCollection).doc(currentUser!.uid);
    await store.set({
      'shop_name':shopname,
      'shop_address':shopaddress,
      'shop_upiId':shopUpiId,
      'shop_phoneNumber':shopphoneNumber
    },SetOptions(merge: true),
    );
    isLoading(false);
  }
}