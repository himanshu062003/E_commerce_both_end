import 'dart:ffi';

import  'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

Widget applogowidget(double width,double height) {
  return Image
      .asset('assets/images/logo-black.png')
      .box
      .white
      .size(width as double, height as double)
      .padding(EdgeInsets.all(8.0))
      .rounded
      .make();
}
