import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websitesticker/button.dart';
import 'package:websitesticker/client/client_screen/Client_home.dart';
import 'package:websitesticker/client/clientlogin.dart';
import 'package:websitesticker/common_widget/app_icon.dart';
import 'package:websitesticker/common_widget/backgroundcommon.dart';
import 'package:websitesticker/const/consts.dart';
import 'package:websitesticker/services/firestore_services.dart';
import 'package:websitesticker/signup.dart';
import 'customer/Homescreenn/home.dart';
import 'customer/controller/auth_controller.dart';

class loginscreen extends StatelessWidget {
  const loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(AuthController());
    // Future<void> loginUser(String email, String password) async {
    //   try {
    //     UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    //       email: email,
    //       password: password,
    //     );
    //
    //     // Retrieve the user's role from Firestore
    //     DocumentSnapshot roleSnapshot = await FirebaseFirestore.instance.collection('userRoles').doc(userCredential.user!.uid).get();
    //     String? userRole;
    //     if (roleSnapshot.exists) {
    //       final data = roleSnapshot.data() as Map<String, dynamic>?; // Cast to Map if it exists
    //       if (data != null && data.containsKey('role')) {
    //         userRole = data['role'] as String?;
    //       }
    //     }
    //    if(userRole=="seller"){
    //      Get.to(()=>HomeClient());
    //      controller.isloading(false);
    //    }else{
    //      Get.to(()=>home());
    //      controller.isloading(false);
    //    }
    //
    //     // Now, you have the user's role and can navigate accordingly
    //   } catch (e) {
    //     // Handle login errors
    //     controller.isloading(false
    //     );
    //     print(e);
    //   }
    // }
    // var is_Seller;
    // var is_cust;
    // Future<void> _loadUserData(BuildContext context) async {
    //   var prefs = await SharedPreferences.getInstance();
    //   is_Seller = prefs.getBool(controller.identifier_seller);
    //   is_cust=prefs.getBool(controller.identifier_customer);
    // }
   

    return bgwidget(
        Scaffold(
         appBar: AppBar(
           title:const Text("Login",style: TextStyle(
             fontWeight: FontWeight.bold,
             color: Colors.white
           ),),
           backgroundColor: pink_color,
         ),
         resizeToAvoidBottomInset: false,
      body:
      Padding(
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
                              prefixIcon: Icon(Icons.email),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: pink_color
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: blue_color
                                  )
                              )


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
                              prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.remove_red_eye),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: pink_color
                              )
                            ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: blue_color
                                  )
                              )
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
                          valueColor: AlwaysStoppedAnimation(pink_color),
                        )
                       : buttonbox(login,pink_color,Colors.white,()
                        async
                         {    controller.isloading(true);
                         await controller.loginMethod(context).then((value) async {
                           var data = value?.user?.email;

                           if (data != null) {
                             try {
                               QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
                                   .collection(usersCollection)
                                   .where('email', isEqualTo:data)
                                   .get();
                               if (querySnapshot.docs.isNotEmpty) {
                                 var userData = querySnapshot.docs.first.data();
                                 String role = userData['role'];
                                 print("role");
                                 VxToast.show(context, msg: loggedinsuccessfully);
                                 Future.delayed(Duration.zero, () {
                                   if (role == "seller") {
                                     Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                         builder: (BuildContext context) => const HomeClient(),
                                       ),
                                     );
                                     // Get.offAll(() => const HomeClient());
                                   } else {
                                     Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                         builder: (BuildContext context) => const home(),
                                       ),
                                     );
                                     Get.offAll(() => const home());
                                   }

                                   // Dispose controllers and reset loading state
                                   
                                   controller.isloading(false);
                                 });


                               } else {
                                 // User not found with the provided email.
                                 print('User not found with email: $email');
                                 controller.isloading(false);
                               }


                             } catch (error) {
                               // Handle any Firestore-related errors here
                               print("Firestore Error: $error");
                               VxToast.show(context, msg: "An error occurred during login.");
                               controller.isloading(false);
                             }
                           } else {
                             // Handle the case where 'data' is null (e.g., user email not available).
                             VxToast.show(context, msg: "User email is not available.");
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
                        buttonbox(signup,pink_color,Colors.white,(){
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

