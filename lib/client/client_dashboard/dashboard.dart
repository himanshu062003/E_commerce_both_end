import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:websitesticker/background.dart';
import 'package:websitesticker/client/client_dashboard/shop_detail.dart';
import 'package:websitesticker/const/consts.dart';
import 'package:websitesticker/customer/controller/auth_controller.dart';
import '../../Client_controller/client_auth_controller.dart';
import '../../login_screen.dart';
import 'client_profile.dart';

class ClientDashboradscreen extends StatelessWidget {
  const ClientDashboradscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(AuthController());

    // Future<void> updateSharedPreference() async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   prefs.setBool(controller.identifier_seller, false);
    //   prefs.setBool(controller.identifier_customer, false);
    // }


    return BackGround(
       Scaffold(
         drawer: Drawer(
         child:
         ListView(
         padding: EdgeInsets.zero,
         children: [
           const DrawerHeader(
             decoration: BoxDecoration(
               color: pink_color,
             ),
             child: Text('Welcome',style: TextStyle(
               fontSize: 18,
               fontWeight: FontWeight.bold,
               color: Colors.white
             ),),
           ),
           ListTile(
             title: const Text('Profile',style: TextStyle(
               fontWeight: FontWeight.bold
             ),),
             onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreenClient()));

             },
           ),
           ListTile(
             title: const Text('Update Shop Details',style: TextStyle(
               fontWeight: FontWeight.bold
             ),),

             onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>ShopDetails()));
             },
           ),

         ],
       ),

    ),
        appBar: AppBar(
          actions: [
            IconButton(onPressed: ()async{
              await Get.put(ClientAuthController()).signoutMethod(context);
           //  await updateSharedPreference();
           //    Navigator.push(context, MaterialPageRoute(builder: (context)=>loginscreen()));
              Get.offAll(()=>loginscreen());
            }, icon:Icon(Icons.logout)),
          ],
          title:const Text("DashBoard",style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                    itemCount: dashboard_icon.length,itemBuilder:(context,index){
                    return Container(
                      padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Color.fromRGBO(102, 199, 244,1),

                      ),
                      child: ListTile(
                        leading:Icon(dashboard_icon[index],color: Colors.white),
                        title: Text(dashboard_name[index],style:const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.white
                              ),),
                        trailing:
                                Text(dashboard_values[index],style:const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500
                                ),)
                        //         ,
                      )

                    ).onTap(() {
                      if(index==5){
                        Get.to(()=>ShopDetails());
                      }
                      if(index==4){
                        Get.to(()=>ProfileScreenClient());
                      }
                    });
                    }),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
