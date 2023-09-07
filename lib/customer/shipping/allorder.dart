import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websitesticker/common_widget/textfieldcomm.dart';
import 'package:websitesticker/const/consts.dart';

import 'package:websitesticker/services/firestore_services.dart';

import '../controller/cart_controller.dart';
import 'order_detail.dart';


class allorderscreen extends StatelessWidget {
  const allorderscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(Cartcontroller());
    return Scaffold(
      appBar: AppBar(

        title: "Your Orders".text.color(Colors.white).bold.make(),
      ),
      body: StreamBuilder(
          stream: FirestoreServices.getorders(currentUser!.uid),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return const Center(
                child:  CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              );
            }
            else if(snapshot.data!.docs.isEmpty){
              return Center(
                child: "Your have 0 orders".text.bold.make(),
              );
            }
            else{
              var data=snapshot.data!.docs;
              return Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    customtextfield("Orders", "Search all orders", controller.searchordercontroller, false,Icons.reorder),
                    20.heightBox,
                    Expanded(
                        child:
                        ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (BuildContext context,int index){
                              return
                                ListTile(
                                  leading: Image.network(
                                      "${data[index]['orders'][0]['img']}"
                                  ),
                                 title: "${data[index]['orders'][0]['title']}".text.size(18).bold.make(),
                                //  subtitle:"${data[index]['order_time']}".text.size(16).color(Colors.blue).bold.make() ,
                                  trailing: IconButton(
                                    onPressed: (){
                                      Get.to(()=> orderdetailscreen(data: data[index]));
                                    },
                                    icon: Icon(Icons.navigate_next_outlined),
                                  )

                              ).box.margin(EdgeInsets.all(4)).border(color: Colors.black).roundedSM.make();

                            })




                    ),

                  ],
                ),
              );
            }

          })
    );
  }
}
