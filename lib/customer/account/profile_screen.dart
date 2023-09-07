import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:websitesticker/button.dart';
import 'package:websitesticker/common_widget/textfieldcomm.dart';
import 'package:websitesticker/const/consts.dart';
import 'package:websitesticker/customer/account/profile_controller.dart';



class profileeditscreen extends StatelessWidget {

  final dynamic data;
  const profileeditscreen({super.key,this.data});

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<profileController>();


    return Scaffold(
      appBar: AppBar(),
      body: Obx(()=>
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             controller.profileImgPath.isEmpty? Image.asset(sp1,width: 130,fit:BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make():
             Image.file(

                 File(controller.profileImgPath.value),
               width: 130,
               fit: BoxFit.cover,

             ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              buttonbox("Change", Colors.blue,Colors.white, (){
               controller.changeImage(context);
              }),
              const Divider(),
              20.heightBox,
              customtextfield(name, namehint, controller.namecontroller, false,Icons.person),
              10.heightBox,
              customtextfield(oldpass, passwordhint,controller.oldpasscontroller, true,Icons.password_rounded),
              10.heightBox,
              customtextfield(newpass, passwordhint,controller.newpasscontroller, true,Icons.password),
            15.heightBox,
            controller.isloading.value? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ) : SizedBox(width: context.screenWidth-60,
                  child: buttonbox("Save",Colors.blue, Colors.white, () async{
                    controller.isloading(true);

                    if(controller.profileimagelink.isNotEmpty){
                      await controller.uploadProfileImage();
                    }else{
                      controller.profileimagelink=data['imageUrl'];
                    }

                  if(data['password']==controller.oldpasscontroller.text){
                    await controller.changeAuthpassword(email: data['email'],password: controller.oldpasscontroller.text,newpassword:controller.newpasscontroller.text);
                    await controller.updateprofileodc(
                        controller.namecontroller.text,
                        controller.newpasscontroller.text,
                        controller.profileimagelink


                    );
                    VxToast.show(context, msg: "Updated");

                  }else{
                    VxToast.show(context, msg: "Entered password is wrong");
                    controller.isloading(false);
                  }





                  }))
            ],
          ).box.shadowSm.padding(const EdgeInsets.all(16)).white.margin(const EdgeInsets.only(top:50,left: 12,right: 12)).make(),
      ),
      )
      );


  }
}
