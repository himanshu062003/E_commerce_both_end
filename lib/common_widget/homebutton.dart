
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/cupertino.dart';
import 'package:websitesticker/const/consts.dart';
import 'package:flutter/material.dart';

Widget Homebutton(width,height,icon, String? title,onpress,context){
  return
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(icon),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.001,
            ),
            title!.text.fontWeight(FontWeight.bold).color(Colors.black).make()
          ],


  ).box.rounded.white.size(width,height).shadowSm.make()
      ;
}
