import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websitesticker/common_widget/textfieldcomm.dart';
import 'package:websitesticker/const/consts.dart';
import 'package:websitesticker/button.dart';

import '../controller/cart_controller.dart';
import 'payment_scrren.dart';



class phonenumberscreen extends StatelessWidget {
  const phonenumberscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(Cartcontroller());
    return Scaffold(
      bottomNavigationBar: buttonbox("Continue", pink_color, Colors.white, (){
        if(controller.addresscontroller.text.length>10){
          Get.to(()=> Paymentscreen());
    }
        else{
          VxToast.show(context, msg: "Need a more detailed address");
        }
      }) ,
      appBar: AppBar(

        title:const Text("Detail Filling",style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
      ),
      body:
         SingleChildScrollView(
           scrollDirection: Axis.vertical,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.01,
              ),
              "Fill the details to complete your shopping".text.bold.size(16).make(),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.008,
              ),
              "Shop and track your orders easily".text.make(),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.008,
              ),
              customtextfield("Address", "Enter your address..", controller.addresscontroller, false,Icons.home),
              customtextfield("City", "Enter your City..", controller.citycontroller, false,Icons.location_city),
              customtextfield("State", "Enter your State..", controller.statecontroller, false,Icons.location_on),
              customtextfield("Pincode", "Enter your Pincode..", controller.pincodecontroller, false,Icons.code),
              customtextfield("Phone Number", "Enter your Mobile Number..", controller.phonecontroller, false,Icons.phone),



            ],



      ).box.padding(EdgeInsets.all(12)).margin(EdgeInsets.all(12)).make(),
         ),
      

    );
  }
}
