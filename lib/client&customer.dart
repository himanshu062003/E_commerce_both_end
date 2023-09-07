import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:websitesticker/client/clientlogin.dart';
import 'package:websitesticker/login_screen.dart';

import 'button.dart';

class ClientOrCustomer extends StatelessWidget {
  const ClientOrCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:const Text("Welcome",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18
        ),),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(

              borderRadius: const BorderRadius.all(Radius.circular(18)),
              border: Border.all(
                  color: Colors.black
              )
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height*0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.person,size: 60),
              const  Text("Register",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24
              ),),


            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: (){
                    Get.to(()=>loginscreen());
                  },

                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue
                  ),

                  child: "Register as a Customer".text.color(Colors.white).fontWeight(FontWeight.bold).make()),
            ),

             Container(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){
                      Get.to(()=>ClientLogin());
                    },

                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue
                    ),

                    child: "Register as a Client".text.color(Colors.white).fontWeight(FontWeight.bold).make()),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
