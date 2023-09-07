import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websitesticker/Client_controller/clinet_profile_controller.dart';
import '../../const/consts.dart';

class ShopDetails extends StatelessWidget {
  const ShopDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(ClientProfileController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:const Text("Profile edit/Shop edit",style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Obx(
          ()=> SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [      SizedBox(
                height: MediaQuery.of(context).size.height*0.0125,
              ),

                TextFormField(
                  controller: controller.shopnameController,
                  decoration:const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                        labelText: "Shop Name",
                      hintText: "Shop Name"
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.0125,
                ),
                TextFormField(
                  controller: controller.shopaddressController,
                  decoration:const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      labelText: "Shop Address",
                      hintText: "Shop Address"
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.0125,
                ),
                TextFormField(
                  controller: controller.shopmobileNumberController,
                  decoration:const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      labelText: "Mobile Number",
                      hintText: "Shop mobile number"
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.0125,
                ),
                TextFormField(
                  controller: controller.shopUpiIdController,
                  decoration:const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      labelText: "Business Upi-Id",
                      hintText: "Shop business Upi-Id"
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.0125,
                ),
                TextFormField(
                  maxLines: 3,
                  controller: controller.shopDescrController,
                  decoration:const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      labelText: "Description",
                      hintText: "Shop description"
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.0125,
                ),
                controller.isLoading.value ?
                const  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  )
                :
                ElevatedButton(
                    onPressed: ()async{
                      controller.isLoading(true);
                     await controller.updateShop(controller.shopnameController.text, controller.shopaddressController.text, controller.shopUpiIdController.text, controller.shopmobileNumberController.text);
                     VxToast.show(context, msg: "Shop data Upated");
                    }, child:const Text("Update",style: TextStyle(
                  fontWeight: FontWeight.bold,color: Colors.blue
                ),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
