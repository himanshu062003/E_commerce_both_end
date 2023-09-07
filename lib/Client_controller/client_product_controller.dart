import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:websitesticker/Client_controller/client_home_controller.dart';
import 'package:websitesticker/modal/category_modal.dart';

import '../const/firebase_const.dart';

class ClientProductController extends GetxController{

  var isLoading=false.obs;

  var productNameController=TextEditingController();
  var productPriceController=TextEditingController();
  var productQuantityController=TextEditingController();
  var productDescriptionController=TextEditingController();


  var categoryList=<String>[].obs;
  var subcategoryList=<String>[].obs;
     var productImageLink=[];
  List<Category> category=[];
  var prodcutImageList=RxList<File?>.generate(3, (index) => null);

  var categoryvalue="".obs;
  var subcategoryvalue="".obs;
  var selectedcolorIndex=0.obs;

  getCategories() async{
    var data=await rootBundle.loadString("lib/services/category_modal.json");
    var cat=categorymodalFromJson(data);
    category=cat.categories;
  }

  populateCategoryList(){
    categoryList.clear();
    for(var item in category){
      categoryList.add(item.name);
    }
  }

  populateSubcategory(cat){
    subcategoryList.clear();
    var data=category.where((element) => element.name==cat).toList();
    for(var i=0;i<data.first.subcategory.length;i++){
      subcategoryList.add(data.first.subcategory[i]);
    }
  }

  pickImage(index,context)async{
    try{
      final img=await ImagePicker().pickImage(source:ImageSource.gallery,imageQuality: 100);
      if(img==null){
        return;
      }else{
        prodcutImageList[index]=File(img.path);
      }
    }catch(e){
      VxToast.show(context, msg: e.toString());

    }

  }

  UploadImage()async{
    for(var item in prodcutImageList){
      if(item!=null){
        var filename=basename(item.path);
        var destination='images/sellers/${currentUser!.uid}/$filename';
        Reference ref=FirebaseStorage.instance.ref().child(destination);
        await ref.putFile(item);
        var n=await ref.getDownloadURL();
        productImageLink.add(n);
      }
    }
  }

  UploadProduct(context)async{
    var store=firestore.collection(productCollection).doc();
 await  store.set({
   'p_category':categoryvalue.value,
   'p_subcategory':subcategoryvalue.value,
   'p_images':FieldValue.arrayUnion(productImageLink),
   'p_name':productNameController.text,
   'p_price':productPriceController.text,
   'p_quantity':productQuantityController.text,
   'p_desc':productDescriptionController.text,
   'seller_id':currentUser!.uid,
   'seller_name':Get.find<ClientHomeController>().username,
   'p_rating':"5.0"


    });
     isLoading(false);
    VxToast.show(context, msg: "Product Uploaded");

  }

  removeProduct(docId) async{
    await firestore.collection(productCollection).doc(docId).delete();
  }








}
