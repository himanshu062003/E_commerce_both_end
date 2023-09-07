import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:websitesticker/const/consts.dart';
import 'package:websitesticker/modal/category_modal.dart';


class productcontroller extends GetxController{
  var subcat=[];
  var quantity=0.obs;
  var colorindex=0.obs;
  var totalprice=0.obs;
  var isfav=false.obs;

  var totalpricecart=0.obs;


  addtoWishlist(DocId)async{
    await firestore.collection(productCollection).doc(DocId).set({
      'p_wishlist':FieldValue.arrayUnion([currentUser!.uid])
    },SetOptions(merge: true));
    isfav(true);
  }

  removeFromWishlist(DocId)async{
    await firestore.collection(productCollection).doc(DocId).set({
      'p_wishlist':FieldValue.arrayRemove([currentUser!.uid])
    },SetOptions(merge: true));
    isfav(false);
  }

  checkifFav(data)async{
    if(data['p_wishlist'].contains(currentUser!.uid)){
      isfav(true);
    }else{
      isfav(false);
    }
  }








  getsubcategories(title) async{
    subcat.clear();
    var data= await rootBundle.loadString("lib/services/category_modal.json");
    var decoded=categorymodalFromJson(data);
    var s=decoded.categories.where((element) =>element.name== title).toList();

    for(var e in s[0].subcategory) {
      subcat.add(e);
    }
    }

    color_index(index){
      colorindex.value=index;
    }
    increment_quantity(){

    quantity.value++;
    }

  deccrement_quantity(){
      if(quantity.value>0){
      quantity.value--;}
  }
 calculatetotal_price(price){
 totalprice.value=price*quantity.value;

 }
 addtocart({title,price,img,color,quantity,context, required seller_id}) async{
    await firestore.collection(cartCollection).doc().set({
       'title':title,
      'price':price,
      'img':img,
      'quantity':quantity,
      'added_by':currentUser!.uid,
      'seller_id':seller_id

    }
    ).catchError((error){
      VxToast.show(context, msg: error.toString());
    });
 }
 resetvalues(){
   quantity.value=0;
   totalprice.value=0;
   colorindex.value=0;
 }

 addtoshipping({title,price,img,color,quantity,context,phoneNumber,address}){

 }





  }

