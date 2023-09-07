import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';

Widget TextFieldBetter( hinttext,labeltext,controller,icon){
  return     TextFormField(
    decoration:  InputDecoration(
        border: OutlineInputBorder(),
        hintText: hinttext,
        labelText: labeltext,
        prefixIcon: Icon(icon),

        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: pink_color
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: blue_color
            )
        )
    ),
    controller: controller,
    obscureText: true,
  );
}