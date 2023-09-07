import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websitesticker/button.dart';
import 'package:websitesticker/const/consts.dart';

import '../../services/firestore_services.dart';
import '../controller/cart_controller.dart';
import '../shipping/phone_number.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(Cartcontroller());
    return Scaffold(
      bottomNavigationBar:   SizedBox(
          width: context.screenWidth-60,
          child: buttonbox("Proceed to Shipping", pink_color,Colors.white, (){
            Get.to(()=> const phonenumberscreen());
          })),
  backgroundColor: lightGrey,
     appBar: AppBar(
       automaticallyImplyLeading: false,
       title: "Shopping Cart".text.color(Colors.white).bold.make(),
     ),
      body: StreamBuilder(stream: FirestoreServices.getcart(currentUser!.uid),
          builder: (BuildContext context ,AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return const  Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              );
            }
            else if(snapshot.data!.docs.isEmpty){
              return Center(
                child: "Your Cart is Empty".text.bold.make(),
              );
            }
            else{
              var data=snapshot.data!.docs;
               controller.calculate(data);
               controller.productsnapshots=data;
              return Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Expanded(
                        child:
                    ListView.builder(
                      itemCount: data.length,
                        itemBuilder: (BuildContext context,int index){
                        return Card(
                          color: Colors.white,
                          child: ListTile(
                            leading: Image.network(
                              "${data[index]['img']}",
                              width: MediaQuery.of(context).size.width*0.15
                              ,fit: BoxFit.contain,
                            ),
                             title: Text("${data[index]['title']} (X${data[index]['quantity']})"),
                            subtitle:"${data[index]['price']}".numCurrency.text.size(16).color(Colors.blue).bold.make() ,
                           trailing: IconButton(
                             icon: Icon(Icons.delete),
                             onPressed: (){
                              FirestoreServices.deletedocument(data[index].id);
                             },
                           ),

                          ),
                        );

                    })

                    ),
                    Divider(color: Colors.black,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        "Total amount".text.bold.make(),
                        Obx(()=>"${controller.totalprice.value}".numCurrency.text.bold.make())
                      ],
                    ).box.width(context.screenWidth-60).padding(EdgeInsets.all(12)).make(),

                  ],
                ),
              );
          }
          })
    );
  }
}
