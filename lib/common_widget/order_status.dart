import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:websitesticker/const/colors.dart';

Widget orderStatus({icon,color,title,showDone,context}){
  return ListTile(
    leading: Container(
      padding: EdgeInsets.all(2),
        decoration:BoxDecoration(
          
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: color
          )
        ),child: Icon(icon,color: color,)),
    trailing: SizedBox(
      height: MediaQuery.of(context).size.height*0.1,
      width: MediaQuery.of(context).size.width*0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("$title",style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            
          ),),
          showDone? Icon(Icons.done,color: pink_color):Container()
        ],
      ),
    ),

  );
}