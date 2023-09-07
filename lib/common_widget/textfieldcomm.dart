import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:websitesticker/const/consts.dart';

Widget customtextfield(String? title,String? hint,controller,ispass,IconData icon){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
        title!.text.color(Colors.red).size(16).fontWeight(FontWeight.w500).make(),
      5.heightBox,
      TextFormField(
        obscureText: ispass,
        controller: controller,
        decoration:  InputDecoration(
          prefixIcon: Icon(icon),
          hintStyle:const TextStyle(
            fontWeight: FontWeight.bold,
            color:Colors.grey
          ),
          hintText: hint,
          isDense: true,

          filled: true,
          border: InputBorder.none,
          focusedBorder:const OutlineInputBorder(
            borderSide: BorderSide
              (
              color: Colors.blue
            )

          )
        ),

      ),
      5.heightBox
    ],
  );
}
