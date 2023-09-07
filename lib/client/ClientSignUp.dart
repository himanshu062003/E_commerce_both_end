//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:websitesticker/client/clientlogin.dart';
// import 'package:websitesticker/controller/auth_controller.dart';
// import 'package:websitesticker/login_screen.dart';
//
// import 'package:websitesticker/common_widget/textfieldcomm.dart';
// import 'package:websitesticker/const/consts.dart';
//
// import '../common_widget/backgroundcommon.dart';
//
// class sellerSignupScreen extends StatefulWidget {
//    sellerSignupScreen({super.key});
//
//   @override
//   State<sellerSignupScreen> createState() => _sellerSignupScreenState();
// }
//
// class _sellerSignupScreenState extends State<sellerSignupScreen> {
//   var controller=Get.put(AuthController());
//   var namecontroller=TextEditingController();
//   var emailcontroller=TextEditingController();
//   var passwordcontroller=TextEditingController();
//   var passwordretypecontroller=TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return bgwidget( Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text("Seller's Sign Up",style: TextStyle(
//             fontWeight: FontWeight.bold
//         ),),
//       ),
//       resizeToAvoidBottomInset: false,
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Center(
//           child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Column(
//               children: [
//                 Obx(()=>
//                     Container(
//                       padding: EdgeInsets.all(16),
//                       width:double.infinity-MediaQuery.of(context).size.width*0.2,
//                       child: Column(
//                         children: [
//                           TextFormField(
//
//                             decoration:const  InputDecoration(
//                                 border: OutlineInputBorder(),
//                                 hintText: "Enter your Name",
//                                 labelText: "Name",
//                                 icon: Icon(Icons.person)
//
//                             ),
//                             controller: namecontroller,
//                             obscureText:false,
//
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height*0.0125,
//                           ),
//                           TextFormField(
//
//                             decoration:const  InputDecoration(
//                                 border: OutlineInputBorder(),
//                                 hintText: "Enter your Email",
//                                 labelText: "E-mail",
//                                 icon: Icon(Icons.email)
//
//                             ),
//                             controller: emailcontroller,
//                             obscureText: false
//                             ,
//
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height*0.0125,
//                           ),
//                           TextFormField(
//
//                             decoration:const  InputDecoration(
//                                 border: OutlineInputBorder(),
//                                 hintText: "Enter your Password",
//                                 labelText: "Password",
//                                 icon: Icon(Icons.key)
//
//                             ),
//                             controller:passwordcontroller,
//                             obscureText: true,
//
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height*0.0125,
//                           ),
//                           TextFormField(
//
//                             decoration:const  InputDecoration(
//                                 border: OutlineInputBorder(),
//                                 hintText: "Enter your confirm Password",
//                                 labelText: "Confirm Password",
//                                 icon: Icon(Icons.key)
//
//                             ),
//                             controller: passwordcontroller,
//                             obscureText: true,
//                           ),
//
//
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height*0.02,
//                           ),
//                           Row(
//                             children: [
//                               Obx(
//                                     ()=> Checkbox(
//                                     checkColor: Colors.blue,
//                                     activeColor: Colors.white,
//                                     value:controller.ischeck.value,
//                                     onChanged: (newValue){
//
//                                       controller.ischeck.value=newValue!;
//
//
//                                     }),
//                               ),
//                               10.widthBox,
//                               Expanded(/**/
//                                 child: RichText(text: const TextSpan(
//                                     children: [
//                                       TextSpan(text: "I agreed to the ",style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.grey
//                                       )),
//                                       TextSpan(text: termsandcondition,style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.blue
//                                       )),
//                                       TextSpan(text:" & ",style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.grey
//                                       )),
//                                       TextSpan(text:privacypolicy,style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.blue
//                                       ))
//
//
//
//                                     ]
//
//
//                                 )),
//                               )
//                             ],
//                           ),
//                           controller.isloading.value
//                               ? const CircularProgressIndicator(
//                             valueColor: AlwaysStoppedAnimation(Colors.blue),
//                           )
//                               : buttonbox(signup,controller.ischeck.value==true? Colors.blue :Colors.grey,Colors.white,() async {
//
//                             if(controller.ischeck.value!=false){
//                               controller.isloading(true);
//                               if(controller.isSeller.value==false){
//                                 try{
//                                   await controller.signupMethod(emailcontroller.text, passwordcontroller.text, context).then((value) {
//                                     return controller.storeUserDats(namecontroller.text, passwordcontroller.text, emailcontroller.text);
//
//                                   }).then((value) {
//                                     VxToast.show(context, msg: loggedinsuccessfully);
//                                     Get.offAll(()=> const home());
//                                   }
//                                   );
//                                 } catch(e){
//                                   auth.signOut();
//                                   VxToast.show(context, msg: e.toString());
//                                   controller.isloading(false);
//                                 }
//                               }
//                               else{
//                                 try{
//                                   await controller.signupMethod(emailcontroller.text, passwordcontroller.text, context).then((value) {
//                                     return controller.storeSellerData(namecontroller.text, passwordcontroller.text, emailcontroller.text);
//
//                                   }).then((value) {
//                                     VxToast.show(context, msg: loggedinsuccessfully);
//                                     Get.offAll(()=> const ClientLogin());
//                                   }
//                                   );
//                                 } catch(e){
//                                   auth.signOut();
//                                   VxToast.show(context, msg: e.toString());
//                                   controller.isloading(false);
//                                 }
//
//                               }
//
//
//                             }
//
//
//
//
//                           }).box.width(context.screenWidth).make(),
//                           10.heightBox,
//
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center
//                             ,
//                             children: [
//                               alreadyhaveaccount.text.make(),
//                               login.text.blue500.fontWeight(FontWeight.bold).make().onTap(() {
//                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>loginscreen()));
//                               })
//                             ],
//                           ),
//
//
//                         ],
//
//
//                       ),
//                     )
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//
//
//     ));
//
//   }
// }
