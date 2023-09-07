import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:websitesticker/const/consts.dart';
Widget SenderBubble(DocumentSnapshot data,context){
  var t=data['created_on']==null ? DateTime.now():data['created_on'].toDate();
  var time=intl.DateFormat("h:mma").format(t);
  return   Directionality(
    textDirection: data['uid']==currentUser!.uid ? TextDirection.rtl:TextDirection.ltr,
    child: Container(
      padding: EdgeInsets.all(8),
      margin:const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          color: data['uid']==currentUser!.uid ? pink_color:blue_color,
          borderRadius:const BorderRadius.only(topLeft: Radius.circular(20),
              topRight: Radius.circular(20),bottomLeft: Radius.circular(20))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${data['msg']}",style:const TextStyle(fontSize: 16),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.001),
          Text(time,style:const TextStyle(
              color: Colors.white
          ),)
        ],
      ),
    ),
  );
}