import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:websitesticker/const/colors.dart';

Widget detail_order_part1({title1,title2,d1,d2,context}){
  return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "${title1}".text.size(17).bold.make(),
              Text("$d1",style: TextStyle(
                color: pink_color
              ),)

            ],
          ),
          SizedBox
            (
            width: MediaQuery.of(context).size.width*0.34,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${title2}",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                ),),
                Text("$d2")

              ],
            ),
          ),

        ],
      ),

  );
}