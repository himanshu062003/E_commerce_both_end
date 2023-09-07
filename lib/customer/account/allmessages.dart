import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websitesticker/common_widget/textfieldcomm.dart';
import 'package:websitesticker/const/consts.dart';
import 'package:websitesticker/customer/categoryscreen/chat_screen.dart';

import 'package:websitesticker/services/firestore_services.dart';

import '../controller/cart_controller.dart';



class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(Cartcontroller());
    return Scaffold(
        appBar: AppBar(
          title: "Your Messages".text.color(Colors.white).bold.make(),
        ),
        body: StreamBuilder(
            stream: FirestoreServices.getAllmessages(),
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
                  child: "Your have 0 messages".text.bold.make(),
                );
              }
              else{

                var data=snapshot.data!.docs;
                return Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Expanded(
                          child:
                          ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (BuildContext context,int index){
                                return
                                  Card(
                                    child: ListTile(
                                      leading:const CircleAvatar(
                                        backgroundColor: pink_color,
                                        child: Icon(Icons.person,color:Colors.white,),
                                      ),
                                      onTap: (){
                                        Get.to(()=>ChatScreen(title: data[index]['friend_name']),arguments: [
                                          data[index]['friend_name'],
                                          data[index]['toId']
                                        ]);
                                      },
                                      title: Text("${data[index]['friend_name']}",style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),),
                                      subtitle: Text("${data[index]['last_msg']}",overflow: TextOverflow.ellipsis),
                                      ),
                                  );

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
