import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:websitesticker/client/client_screen/Client_home.dart';
import 'package:websitesticker/const/colors.dart';
import 'package:websitesticker/customer/Homescreenn/home.dart';

import 'package:websitesticker/login_screen.dart';

import 'common_widget/app_icon.dart';
import 'const/firebase_const.dart';
import 'const/strings.dart';
import 'customer/controller/auth_controller.dart';
import 'entrypath.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {





//   screenchanger()async{
//     QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
//         .collection(usersCollection)
//         .where('id', isEqualTo:currentUser!.uid)
//         .get();
//
// //    if (querySnapshot.docs.isNotEmpty) {
//       var userData = querySnapshot.docs.first.data();
//       String role = userData['role'];
//
//       Future.delayed(const Duration(seconds: 3), () {
//         auth.authStateChanges().listen((User? user) {
//           if (user == null && mounted) {
//             Get.to(() => loginscreen());
//           }
//           else {
//             if(role=="seller"){
//               Get.offAll(() => const HomeClient());
//           }
//             else {
//               Get.offAll(() => const home());
//             }
//           }
//         });
//       });
    // } else {
    //
    //   Future.delayed(const Duration(seconds: 3), () {
    //     auth.authStateChanges().listen((User? user) {
    //
    //         Get.to(() => loginscreen());
    //
    //     });
    //   });
    // }
//  }
  screenchanger() async {
    User? user = auth.currentUser; // Get the current user

    if (user == null) {
      // If the user is not logged in, navigate to the login screen
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          Get.to(() => loginscreen());
        }
      });
    } else {
      // User is logged in, fetch their role
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance
          .collection(usersCollection)
          .where('id', isEqualTo: user.uid)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var userData = querySnapshot.docs.first.data();
        String role = userData['role'];

        Future.delayed(const Duration(seconds: 3), () {
          auth.authStateChanges().listen((User? user) {
            if (user == null && mounted) {
              Get.to(() => loginscreen());
            } else if (role == "seller") {
              Get.offAll(() => const HomeClient());
            } else {
              Get.offAll(() => const home());
            }
          });
        });
      } else {
        // Handle the case where user data is not found
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) {
            Get.to(() => loginscreen());
          }
        });
      }
    }
  }


  @override
  void initState() {
    screenchanger();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: pink_color,
      body: Center(
      child:  Column(
        children: [
             SizedBox(
               height: MediaQuery.of(context).size.height*0.3,
             ),
             
             applogowidget(MediaQuery.of(context).size.width*0.4,MediaQuery.of(context).size.height*0.2),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.025,
          ),
           appname.text.fontWeight(FontWeight.bold).size(22).make(),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.0125,
          ),
          appversion.text.white.make(),
          const Spacer(),
          credits.text.fontWeight(FontWeight.w500).make(),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.05,
          )




        ],

    ),

    ),




    );
  }
}
