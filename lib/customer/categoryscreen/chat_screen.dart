import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websitesticker/common_widget/sender_bubble.dart';
import 'package:websitesticker/const/consts.dart';

import 'package:websitesticker/services/firestore_services.dart';

import '../controller/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  final String? title;
  const ChatScreen({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(ChatsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink_color,
        title: Text(title!,style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Obx(()=>
            controller.isLoading.value ?  const Center(
            child: CircularProgressIndicator(),
    ):
               Expanded(child:StreamBuilder(
                    stream: FirestoreServices.getChatmessages(controller.chatDocId.toString()),
                    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
                      if(!snapshot.hasData){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }else if(snapshot.data!.docs.isEmpty){
                        return const Center(
                          child: Text("Send a message.."),
                        );
                      }
                      else{
                        return  ListView(
                          children:snapshot.data!.docs.mapIndexed((currentValue, index){
                            var data=snapshot.data!.docs[index];
                            return Align(
                              alignment: data['uid']==currentUser!.uid ? Alignment.centerRight :Alignment.centerLeft,
                                child: SenderBubble(data,context));
                          }).toList()
                        );
                      }

                    },
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
               Expanded(child: TextFormField(
                 controller: controller.msgController,
                 decoration:const InputDecoration(
                   border: OutlineInputBorder(
                     borderSide: BorderSide(
                       color: Colors.grey
                     )
                   ),
                   hintText: "Send a Message...",
                 ),
               )),
                  IconButton(onPressed: ()async{
                    await controller.sendMsg(controller.msgController.text);
                    controller.msgController.clear();
                  }, icon: Icon(Icons.send))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
