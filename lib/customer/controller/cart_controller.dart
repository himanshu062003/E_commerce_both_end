import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websitesticker/const/consts.dart';


import 'home_controller.dart';

class Cartcontroller extends GetxController{

  var totalprice=0.obs;

  var products=[];
  var sellers=[];

  late dynamic productsnapshots;
  var phonecontroller=TextEditingController();
  var addresscontroller=TextEditingController();
  var citycontroller=TextEditingController();
  var statecontroller=TextEditingController();
  var pincodecontroller=TextEditingController();

  var searchordercontroller=TextEditingController();

  var paymentindex=0.obs;
  var placemyOrder=false.obs;

  
  calculate(data){
    totalprice.value=0;
    for(int i=0;i<data.length;i++){
      totalprice.value+=int.parse(data[i]['price'].toString());
    }
  }


  chngepaymentindex(index){
    paymentindex.value=index;
  }

  placedmyorder({required orderpaymentmethod,required totalprice,context}) async{
    placemyOrder(true);
    await getproductdetail();

    await firestore.collection(orderCollections).doc().set({
      "order_by":currentUser!.uid,
      "order_time":FieldValue.serverTimestamp(),
      "order_email":currentUser!.email,
      "order_by_name":Get.find<homecontroller>().username,
      "order_address":addresscontroller.text,
      "order_state":statecontroller.text,
      "order_city":citycontroller.text,
      "order_pincode":pincodecontroller.text,
      "order_phonenumber":phonecontroller.text,
      "shipping method":"Home Delivery",
      "order_placed":true,
      "order_confirmed":false,
      "order_delivered":false,
      "order_on_delivery":false,
      "Payment_method":orderpaymentmethod,
      "total_amount":totalprice,
      "orders":FieldValue.arrayUnion(products),
      "sellers":FieldValue.arrayUnion(sellers)
    } );
        placemyOrder(false);
  }
  getproductdetail() {
    products.clear();
    sellers.clear();
    for(var i=0;i<productsnapshots.length;i++){
      products.add({
        'img' :productsnapshots[i]['img'],
        'amount' :productsnapshots[i]['price'],
        'seller_id':productsnapshots[i]['seller_id'],
        'quantity' :productsnapshots[i]['quantity'],
        'title' :productsnapshots[i]['title'],
      }  );
      sellers.add(productsnapshots[i]['seller_id']);


    }
  }


  clearCart(){
    for(var i=0;i<productsnapshots.length;i++){
      firestore.collection(cartCollection).doc(productsnapshots[i].id).delete();
    }
  }

}
