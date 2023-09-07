
import 'package:websitesticker/const/consts.dart';
import 'package:flutter/material.dart';

Widget featurebutton(image,String? title,onpress,context){
  return
    // Column(
    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    // children: [

         Image.asset(image,
         width: 40,
         fit: BoxFit.fill
       //    ,),
    //   10.heightBox,
    //   title!.text.fontWeight(FontWeight.w500).color(Colors.grey).make()
    //
    // ],
  ).box.roundedSM.border(color: Colors.grey).width(double.infinity).height(MediaQuery.of(context).size.height*0.2).margin(EdgeInsets.symmetric(horizontal: 4)).padding(EdgeInsets.all(8)).outerShadowSm.white.make();
}
