import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget chatBubble(context){
  return Directionality(textDirection: TextDirection.ltr,
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(bottom: 8),
        decoration:const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20))

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your message here..."),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            Text("10:45PM"),
          ],
        ),
      ));
}