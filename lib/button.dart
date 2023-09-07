import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:websitesticker/const/consts.dart';

Widget buttonbox( String? title,backcolor,textcolor,onpress){
  return ElevatedButton(
      onPressed: onpress,

      style: ElevatedButton.styleFrom(
        backgroundColor: backcolor
      ),

      child: title!.text.color(textcolor).fontWeight(FontWeight.bold).make());
}
