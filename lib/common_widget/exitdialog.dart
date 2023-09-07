
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:websitesticker/button.dart';
import 'package:websitesticker/common_widget/homebutton.dart';
import 'package:websitesticker/const/consts.dart';

Widget exitDialog(context){
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Confirm".text.size(18).make(),
        20.heightBox,
        "Are you sure you want to Exit?".text.size(18).make(),
        Divider(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
         buttonbox("Yes", Colors.red, Colors.white, (){
           SystemNavigator.pop();
         }),
            buttonbox("No", Colors.red, Colors.white, (){
              Navigator.pop(context);
            }),
          ],
        )
      ],
    ).box.roundedSM.padding(EdgeInsets.all(8)).make(),
  );
}