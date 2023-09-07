
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:websitesticker/button.dart';
import 'package:websitesticker/client/clientlogin.dart';
import 'package:websitesticker/common_widget/app_icon.dart';
import 'package:websitesticker/common_widget/backgroundcommon.dart';
import 'package:websitesticker/common_widget/textfieldcomm.dart';
import 'package:websitesticker/const/consts.dart';

import 'package:websitesticker/signup.dart';

import '../customer/controller/auth_controller.dart';

class Clientloginscreen extends StatelessWidget {
  const Clientloginscreen({super.key});


  @override
  Widget build(BuildContext context) {
    var controller=Get.put(AuthController());


    return bgwidget(
        Scaffold(
          appBar: AppBar(
            title: Text("Login",style: TextStyle(
                fontWeight: FontWeight.bold
            ),),
            backgroundColor: Colors.blue,
          ),
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.025,
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      width:double.infinity-MediaQuery.of(context).size.width*0.2,
                      child: Obx(()=>
                          Column(
                            children: [
                              TextFormField(
                                decoration:const  InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Enter your E-mail",
                                    labelText: "E-mail",
                                    icon: Icon(Icons.phone)

                                ),
                                controller: controller.emailcontroller,
                                obscureText: false,

                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.015,
                              ),
                              TextFormField(

                                decoration:const  InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Enter your Password",
                                    labelText: "Password",
                                    icon: Icon(Icons.password)

                                ),
                                controller: controller.passcontroller,
                                obscureText: true,

                              ),



                              Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(onPressed:(){}, child: forgetpass.text.make())
                              ),

                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.0125,
                              ),
                              controller.isloading.value
                                  ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(Colors.blue),
                              )
                                  : buttonbox(login,Colors.blue,Colors.white,()
                              async
                              {
                                controller.isloading(true);
                                await controller.loginMethod(context).then((value) {
                                  if(value!=null){
                                    VxToast.show(context, msg: loggedinsuccessfully);

                                      Get.to(()=>ClientLogin());

                                  }else{
                                    controller.isloading(false);
                                  }
                                });


                              }).box.width(context.screenWidth).make(),
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.0125,
                              ),
                              createnewaccount.text.gray500.make(),
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.0125,
                              ),
                              buttonbox(signup,Colors.blue,Colors.white,(){
                                Get.to(()=> const signupscreen());
                              }).box.width(context.screenWidth).make(),



                            ],


                          )
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),


        ));
  }
}

