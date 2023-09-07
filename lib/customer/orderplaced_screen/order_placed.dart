import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:websitesticker/login_screen.dart';

import '../shipping/order_detail.dart';


class orderplacedscreen extends StatefulWidget {
  const orderplacedscreen({super.key});

  @override
  State<orderplacedscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<orderplacedscreen> {






  //for chnging of screen
  screenchanger(){

    Future.delayed(const Duration(seconds: 3),() {



         // Get.to(() => const orderdetailscreen());
      









    }
    );
  }


  @override
  void initState() {
    screenchanger();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      body: Center(
        child:  Column(
          children: [
            320.heightBox,
             Image.asset("assets/images/orderplaced.png",width: 150,),
            20.heightBox,
            "Order Confirmed!".text.bold.size(20).fontWeight(FontWeight.bold).make()
           



          ],

        ),

      ),




    );
  }
}