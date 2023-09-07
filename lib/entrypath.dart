import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websitesticker/button.dart';
import 'package:websitesticker/client/client_screen/Client_home.dart';
import 'package:websitesticker/const/consts.dart';

import 'const/colors.dart';
import 'customer/Homescreenn/home.dart';

class entryPath extends StatelessWidget {
  const entryPath({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink_color,
      ),
    body: Center(
      child: Column(
        children: [
          buttonbox("Enter as Customer", pink_color, Colors.white, (){
            Get.to(()=>home());
          }),
          buttonbox("Enter as Seller", pink_color, Colors.white, (){
            Get.to(()=>HomeClient());
          })
        ],
      ),
    ),
    );
  }
}
