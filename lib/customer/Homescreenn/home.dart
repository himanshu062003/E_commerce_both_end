import 'package:flutter/material.dart';
import 'package:websitesticker/common_widget/exitdialog.dart';
import 'package:websitesticker/const/consts.dart';
import 'package:get/get.dart';
import 'package:websitesticker/customer/Homescreenn/homescreen.dart';
import '../account/accountt.dart';
import '../cart/cart.dart';
import '../categoryscreen/category.dart';
import '../controller/home_controller.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(homecontroller());
    var navbaritem=[
      const BottomNavigationBarItem(icon:Icon(Icons.home),label: homey),
      const BottomNavigationBarItem(icon:Icon(Icons.category),label: categories),
      const BottomNavigationBarItem(icon:Icon(Icons.shopping_cart),label: cart),
      const BottomNavigationBarItem(icon:Icon(Icons.person),label: account),
    ];
    var navbody=
    [
     const Homescreen(),const Categoryscreen(),const Cartscreen(),const Accountscreen()
     ];


      return  WillPopScope (
        onWillPop: () async{
   showDialog(
       barrierDismissible: false,
       context: context, builder: (context) => exitDialog(context));
         return false;
        },
        child: Scaffold(

        body: Column(
          children: [
            Obx(()=> Expanded(child: navbody.elementAt(controller.currentnavindex.value),)),
          ],
        ),
          bottomNavigationBar: Obx(()=>

             BottomNavigationBar(
              currentIndex: controller.currentnavindex.value,
              selectedItemColor: pink_color,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              type :BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              items: navbaritem,
               onTap: (value){
                controller.currentnavindex.value=value;
               },

            ),
          ),


    ),
      );
  }
}
