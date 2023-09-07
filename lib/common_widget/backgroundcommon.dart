
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:websitesticker/const/images.dart';


Widget bgwidget(Widget? child){
  return Container(
       decoration:const BoxDecoration(
         image: DecorationImage(
           image: AssetImage("assets/images/background.jpg"),
         ),
       ),

    child: child,

  );
}