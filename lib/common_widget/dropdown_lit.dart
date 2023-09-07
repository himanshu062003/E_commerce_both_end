import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websitesticker/Client_controller/client_product_controller.dart';
import 'package:websitesticker/const/colors.dart';


Widget ProductDropDownList(hint,RxList<String> list,dropvalue,ClientProductController controller){
  return Obx(
      ()=> Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          color: pink_color
        )
      ),
      padding: EdgeInsets.all(8),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: dropvalue.value==""? null:dropvalue.value,
          isExpanded: true,
          hint: Text("$hint"),
          items:list.map((e){
            return DropdownMenuItem(
              child:Text(e.toString()),
              value: e,
            );
                 }).toList(),
          onChanged: (newValue) {
            if(hint=="Category"){
              controller.subcategoryvalue.value="";
              controller.populateSubcategory(newValue.toString());
            }
            dropvalue.value=newValue.toString();
          },

        )


      ),
    ),
  );
}