import 'package:flutter/material.dart';
import 'package:websitesticker/const/consts.dart';

Widget detailcard(width,  String? count,String? title){
  return  Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      border: Border.all(
        color: pink_color
      ),
      borderRadius: BorderRadius.all(Radius.circular(12))
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        count!.text.size(16).fontWeight(FontWeight.bold).make(),
        5.heightBox,
        title!.text.fontWeight(FontWeight.bold).make()
      ],
    )
  );
}
