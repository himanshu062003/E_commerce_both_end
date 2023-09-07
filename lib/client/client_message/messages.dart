import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websitesticker/client/client_message/user_message.dart';
import 'package:websitesticker/const/consts.dart';
import 'package:websitesticker/services/firestore_services.dart';
import '../../services/client_services.dart';
import 'package:intl/intl.dart' as intl;

class ClientMessagescreen extends StatelessWidget {
  const ClientMessagescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading:const Icon(Icons.message_outlined),
        title:const Text("Messages",style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white

        ),),

      ),
      body: StreamBuilder(
        stream:  ClientServices.getmessage(currentUser!.uid),
    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
        );
      }
      else if(snapshot.data!.docs.isEmpty){
        return const Center(
          child: Text("You have 0 messages"
              ),
        );
      }
      else {
                   var data=snapshot.data!.docs;
        return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(data.length, (index)
            {     var t=data[index]['created_on']==null ? DateTime.now():data[index]['created_on'].toDate();
                  var time=intl.DateFormat("h:mma").format(t);
                  return Card(
                    color: blue_color,
                    child: ListTile(
                        onTap: (){
                          Get.to(()=>UserMessage(title: data[index]['sender_name'],),
                              arguments: [
                                data[index]['sender_name'],data[index]['fromId']
                              ]
                          );
                        },
                        leading: const CircleAvatar(
                          backgroundColor: pink_color,
                          child: Icon(Icons.person,
                          color: Colors.white,),
                        ),
                          title: Text("${data[index]['sender_name']}", style:const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                            ),),
                        subtitle: Text("${data[index]['last_msg']}",overflow: TextOverflow.ellipsis,style:const TextStyle(
                          color: Colors.white
                        ),),
                        trailing: Text(time,style:const TextStyle(
                          fontWeight: FontWeight.bold
                        ),),


                    ),
                  );
    }

                  ),


                ),
              ),

          );
      }
    }
    )

    );
  }
}
