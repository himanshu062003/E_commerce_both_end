import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../button.dart';
import '../customer/controller/auth_controller.dart';
class ClientLogin extends StatelessWidget {
  const ClientLogin({super.key});


  @override
  Widget build(BuildContext context) {
    var controller=Get.put(AuthController());
    return  Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title:const Text("Registration",style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:12.0,right: 12.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.store,size: 100,),

                SizedBox(
                  height: MediaQuery.of(context).size.height*0.005,
                ),
                TextFormField(
               //   controller: shopname,
                  decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your shop name",
                      labelText: "Shop Name",
                      icon: Icon(Icons.storefront)

                  ),

                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.015,
                ),

                TextFormField(
                  decoration:const  InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your Phone Number",
                      labelText: "Phone Number",
                      icon: Icon(Icons.phone)

                  ),

                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.015,
                ),

                TextFormField(
                  decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your Upi-id",
                      labelText: "UPI-Id",
                      icon: Icon(Icons.payment)

                  ),

                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height*0.015,
                ),

                TextFormField(
                  //    controller: _selectedItem,
              //    controller: servicesType,
                  onTap: () {
                    // _showDropdown(context);
                  },
                  decoration:const InputDecoration(

                    border: OutlineInputBorder(),
                    hintText: "Select the type of services",
                    labelText: "Services Type",
                    icon: Icon(Icons.store_mall_directory),
                    suffixIcon: Icon(Icons.arrow_drop_down),
                  ),



                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.015,
                ),
                TextFormField(
                  decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your Address",
                      labelText: "Shop Address",
                      icon: Icon(Icons.location_on)
                  ),
                  maxLines: 3,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.015,
                ),
                Container(
                  width: double.infinity,
                  child: buttonbox("Register",Colors.blue,Colors.white,(){

                  }),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
