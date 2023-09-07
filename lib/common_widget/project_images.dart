import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:websitesticker/const/colors.dart';

Widget productImages( {required label, required context}){
  return Container(
    padding: EdgeInsets.all(8),
    height: MediaQuery.of(context).size.height*0.14,
    width: MediaQuery.of(context).size.width/3.5,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      border: Border.all(
        color: pink_color
      ),

    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
        "$label",
          textAlign:TextAlign.center,
          style: TextStyle(
fontSize: 16,
          fontWeight: FontWeight.bold

        ),),
        Text("Click to Upload Images")
      ],
    ),
  );
}