import 'package:flutter/cupertino.dart';

Widget BackGround(child){
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage("assets/images/back.jpg")
      )
    ),
    child:child,
  );
}