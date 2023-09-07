import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:websitesticker/common_widget/accountsamebutt.dart';
import 'package:websitesticker/const/consts.dart';
import 'package:get/get.dart';
import 'package:websitesticker/customer/account/allmessages.dart';
import 'package:websitesticker/customer/account/profile_controller.dart';
import 'package:websitesticker/customer/account/profile_screen.dart';
import 'package:websitesticker/customer/account/wishlist_screen.dart';
import 'package:websitesticker/login_screen.dart';
import 'package:websitesticker/services/firestore_services.dart';

import '../controller/auth_controller.dart';
import '../shipping/allorder.dart';

class Accountscreen extends StatelessWidget {
  const Accountscreen({super.key, });


  @override
  Widget build(BuildContext context) {
    var controller=Get.put(profileController());
    Future<void> updateSharedPreference() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool(Get.put(AuthController()).identifier_seller, false);
      prefs.setBool(Get.put(AuthController()).identifier_customer, false);
    }
    return 
      Scaffold(
        appBar: AppBar(
          backgroundColor: pink_color,
          leading: Icon(Icons.person_pin_outlined),
          title: const Text("Account",style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),),
        ),
        body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              );
            }
            else {

               var  data=snapshot.data!.docs[0];
              return
          SafeArea(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topRight,
                            child: const Icon(Icons.edit, color: pink_color,)
                                .onTap(() {
                              controller.namecontroller.text
                            =data['name'];
                              Get.to(() => profileeditscreen(data: data,));
                            })),

                              data['imageUrl']=='' && controller.profileImgPath.isEmpty
                                  ?
                              Container(
                                clipBehavior: Clip.antiAlias,
                                decoration:const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(96))
                                ),
                                child: Image.asset(sp1, width: MediaQuery.of(context).size.width*0.3,height: MediaQuery.of(context).size.height*0.15, fit: BoxFit.cover,)
                              )
                                  :data['imageUrl']!='' && controller.profileImgPath.isEmpty
                             ? Container(
                                clipBehavior: Clip.antiAlias,
                                decoration:const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(96))
                                ),
                               child: Image.network(data['imageUrl'], width: MediaQuery.of(context).size.width*0.3, fit: BoxFit.cover,)

                             )
                              :Container(
                                clipBehavior: Clip.antiAlias,
                                decoration:const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(96))
                                ),
                                child: Image.file(File(controller.profileImgPath.value),width: MediaQuery.of(context).size.width*0.3, fit: BoxFit.cover,)
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.025,
                              ),
                                  Text("Name : ${data['name']}",style:const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),),
                                  Text("Email : ${data['email']}",style:const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                  ),),
                                 OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                          color: pink_color,
                                                  )
                                    ),
                                    onPressed: () async {
                                      await Get.put(AuthController()).signoutMethod(context);
                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>loginscreen()));
                                      Get.offAll(()=>loginscreen());
                                    },
                                    child: "Log Out".text.color(pink_color)
                                        .fontWeight(FontWeight.w700)
                                        .make()),
                        20.heightBox,
                        FutureBuilder(future: FirestoreServices.getCounts(), builder:(BuildContext context,AsyncSnapshot snapshot){
                          if(!snapshot.hasData){
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }else{
                            var countdata=snapshot.data;                            return   Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  detailcard(
                                      context.screenWidth / 3.5,
                                      countdata[0].toString(),
                                      "In Your Cart"),
                                  detailcard(
                                      context.screenWidth / 3.5,
                                      countdata[1].toString(),
                                      "In Your Wishlist"),
                                  detailcard(
                                      context.screenWidth / 3.5,
                                      countdata[2].toString(),
                                      " Your Orders"),
                                ]
                            );
                          }
                        }),



                        40.heightBox,
                        ListView
                            .separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  if(index==0){
                                    Get.to(()=>allorderscreen());
                                  }
                                  if(index==1){
                                    Get.to(()=>WishListScreen());
                                  }
                                  if(index==2){
                                    Get.to(()=>MessagesScreen());
                                  }

                                },
                                child: ListTile(

                                  leading: profilebuttonicon[index],
                                  title: profilebuttonlist[index].text.fontWeight(
                                      FontWeight.bold).make(),

                                ),
                              );
                            }, separatorBuilder: (context, index) {
                          return  const Divider(
                            color: lightGrey,
                          );
                        }, itemCount: profilebuttonicon.length)
                            .box
                            .white
                            .shadowSm
                            .padding( const EdgeInsets.symmetric(horizontal: 16))
                            .make()
                      ],
                    ),
                  )
              );


            }

          },

        )



      
    );
  }
}
