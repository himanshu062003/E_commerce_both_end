import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websitesticker/client/client_screen/Client_home.dart';
import 'package:websitesticker/login_screen.dart';
import 'button.dart';
import 'common_widget/app_icon.dart';
import 'common_widget/backgroundcommon.dart';
import 'package:websitesticker/common_widget/textfieldcomm.dart';
import 'package:websitesticker/const/consts.dart';

import 'customer/Homescreenn/home.dart';
import 'customer/controller/auth_controller.dart';

class signupscreen extends StatefulWidget {
  const signupscreen({super.key});

  @override
  State<signupscreen> createState() => _signupscreenState();
}

class _signupscreenState extends State<signupscreen> {

  var controller=Get.put(AuthController());
  var namecontroller=TextEditingController();
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  var passwordretypecontroller=TextEditingController();
  var rolecontroller=TextEditingController();

  // Future<void> registerUser(String email, String password, String role) async {
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     // Store the user's role in Firestore
  //     await FirebaseFirestore.instance.collection(userroleCollection).doc(userCredential.user!.uid).set({
  //       'role': role,
  //     });
  //
  //   } catch (e) {
  //     // Handle registration errors
  //     print(e);
  //   }
  // }

  // Future<void> _saveUserData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool(controller.identifier_seller,controller.isSeller.value);
  //   await prefs.setBool(controller.identifier_customer,!controller.isSeller.value);
  // }

  @override
  Widget build(BuildContext context) {
    return bgwidget( Scaffold(
      appBar: AppBar(
        backgroundColor: pink_color,
        title: Text("Sign Up",style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Obx(()=>
                  Container(
                    padding: EdgeInsets.all(16),
                    width:double.infinity-MediaQuery.of(context).size.width*0.2,
                    child: Column(
                      children: [
                        TextFormField(

                          decoration:const  InputDecoration(
                              border: OutlineInputBorder(),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: pink_color
                                )
                            ),
                              hintText: "Enter your Name",
                              labelText: "Name",
                            prefixIcon: Icon(Icons.person,color: pink_color,),

                          ),
                          controller: namecontroller,
                          obscureText:false,

                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.0125,
                        ),
                        TextFormField(

                          decoration:const  InputDecoration(
                              border: OutlineInputBorder(),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: pink_color
                                )
                            ),
                              hintText: "Enter your Email",
                              labelText: "E-mail",
                              prefixIcon: Icon(Icons.email,color: pink_color,),


                          ),
                          controller: emailcontroller,
                          obscureText: false
                          ,

                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.0125,
                        ),
                        TextFormField(

                          decoration:const  InputDecoration(
                              border: OutlineInputBorder(),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: pink_color
                                )
                            ),
                              hintText: "Enter your Password",
                              labelText: "Password",
                            prefixIcon: Icon(Icons.lock,color: pink_color,),

                          ),
                          controller:passwordcontroller,
                          obscureText: true,

                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.0125,
                        ),
                        TextFormField(

                          decoration:const  InputDecoration(
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: pink_color
                                )
                            ),
                              border: OutlineInputBorder(),
                              hintText: "Enter your confirm Password",
                              labelText: "Confirm Password",
                            prefixIcon: Icon(Icons.lock,color: pink_color,),
                          ),
                          controller: passwordretypecontroller,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.0125,
                        ),
                        TextFormField(

                          decoration:const  InputDecoration(
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: pink_color
                                )
                            ),
                            border: OutlineInputBorder(),
                            hintText: "seller/customer",
                            labelText: "seller/customer",
                            prefixIcon: Icon(Icons.admin_panel_settings,color: pink_color,),
                          ),
                          controller: rolecontroller,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.02,
                        ),
                        // Row(
                        //   children: [
                        //     Obx(
                        //           ()=> Checkbox(
                        //           checkColor: pink_color,
                        //           activeColor: Colors.white,
                        //           value:controller.isSeller.value,
                        //           onChanged: (newValue){
                        //             controller.isSeller.value=newValue!;
                        //           }),
                        //     ),
                        //     SizedBox(
                        //       width: MediaQuery.of(context).size.width*0.025,
                        //     ),
                        //     const Text("I am a Seller",style: TextStyle(
                        //         fontSize: 16,
                        //         fontWeight: FontWeight.bold
                        //     ),)
                        //   ],
                        // ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.02,
                        ),
                       Row(
                         children: [
                           Obx(
                           ()=> Checkbox(
                                 checkColor: pink_color,
                                 activeColor: Colors.white,
                                 value:controller.ischeck.value,
                                 onChanged: (newValue){
                                     controller.ischeck.value=newValue!;
                             }),
                           ),
                           10.widthBox,
                           Expanded(/**/
                             child: RichText(text: const TextSpan(
                               children: [
                                 TextSpan(text: "I agreed to the ",style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   color: Colors.grey
                                 )),
                                 TextSpan(text: termsandcondition,style: TextStyle(
                                     fontWeight: FontWeight.bold,
                                     color: pink_color
                                 )),
                                 TextSpan(text:" & ",style: TextStyle(
                                     fontWeight: FontWeight.bold,
                                     color: Colors.grey
                                 )),
                                 TextSpan(text:privacypolicy,style: TextStyle(
                                     fontWeight: FontWeight.bold,
                                     color: pink_color
                                 ))
                               ]
                             )),
                           )
                         ],
                       ),
                        controller.isloading.value
                            ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(pink_color),
                        )
                        : buttonbox(signup,controller.ischeck.value==true? pink_color :Colors.grey,Colors.white,() async {
                              //  _saveUserData();
                          if(controller.ischeck.value!=false){
                            controller.isloading(true);
                       //       await registerUser(emailcontroller.text, passwordcontroller.text, rolecontroller.text);
                    // //        if(controller.isSeller.value==false){
                              try{
                                await controller.signupMethod(emailcontroller.text, passwordcontroller.text,context).then((value) {
                                  return controller.storeUserDats(namecontroller.text, passwordcontroller.text, emailcontroller.text,rolecontroller.text);
                                }).then((value) {

                                  VxToast.show(context, msg: loggedinsuccessfully);
                                  controller.isloading(true);
                                  if(rolecontroller.text=="seller"){
                                    Get.offAll(()=> const HomeClient());
                                    controller.isloading(false);
                                  }
                                  else{
                                    Get.offAll(()=> const home());
                                    controller.isloading(false);
                                  }

                                }
                                );
                              } catch(e){
                               // auth.signOut();
                                VxToast.show(context, msg: e.toString());
                                controller.isloading(false);
                              }
                        //   }
                            // else{
                            //   try{
                            //     await controller.signupMethod(emailcontroller.text, passwordcontroller.text, context).then((value) {
                            //       return controller.storeSellerData(namecontroller.text, passwordcontroller.text, emailcontroller.text);
                            //     }).then((value) {
                            //       VxToast.show(context, msg: loggedinsuccessfully);
                            //       Get.offAll(()=> const HomeClient());
                            //     }
                            //     );
                            //   } catch(e){
                            //     auth.signOut();
                            //     VxToast.show(context, msg: e.toString());
                            //     controller.isloading(false);
                            //   }
                            //
                            // }


                          }




                        }).box.width(context.screenWidth).make(),
                        10.heightBox,

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center
                          ,
                          children: [
                            alreadyhaveaccount.text.make(),
                            login.text.color(pink_color).fontWeight(FontWeight.bold).make().onTap(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>loginscreen()));
                            })
                          ],
                        ),


                      ],


                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),


    ));

  }
}
