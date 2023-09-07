import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websitesticker/client/client_dashboard/shop_detail.dart';
import 'package:websitesticker/const/colors.dart';
import 'package:websitesticker/const/consts.dart';
import 'package:websitesticker/services/client_services.dart';

import '../../button.dart';
import '../../const/images.dart';

class ProfileScreenClient extends StatelessWidget {
  const ProfileScreenClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink_color,
        title:const Text("Profile Screen",style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
      ),
      body: StreamBuilder(
        stream: ClientServices.getUser(currentUser!.uid),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
    if(!snapshot.hasData){
    return const Center(
    child: CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(Colors.blue),
    ),
    );
    }
    else {
      var data = snapshot.data!.docs[0];
      return
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.00025,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(onPressed: (){
                    Get.to(()=>ShopDetails());
                  }, icon: Icon(Icons.edit,size: 25,))),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.001,
              ),
              Container(
                padding: EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    border: Border.all(
                        color: Colors.grey
                    )
                ),
                child: Text("${data['name']}",style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 24
                ),),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.0125,
              ),
              Center(
                child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(96))
                    ),
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius:MediaQuery.of(context).size.height*0.1,
                        child: Image.asset(w1,height: MediaQuery.of(context).size.height*0.15, fit: BoxFit.cover,))

                ),
              ),
              buttonbox("Change Image",Colors.blue,Colors.white,(){

              }),
              const Divider(color: Colors.grey,thickness: 2),

               Card(
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Owner Name:${data['name']}"),
                ),
              ),

                Card(
                child: ListTile(
                  leading: Icon(Icons.email),
                  title: Text("Shop address:${data['email']}"),
                ),
              ),

               Card(
                child: ListTile(
                  leading: Icon(Icons.lock),
                  title: Text("Password:${data['password']}"),
                ),
              ),

              //  Card(
              //   child: ListTile(
              //     leading: Icon(Icons.payment),
              //     title: Text("Business Upi-Id: ${data['shop_upiId']}"),
              //   ),
              // ),
              const Card(
                child: ListTile(
                  leading: Icon(Icons.payment),
                  title: Text("Description: this is a demo shop"),
                ),
              ),
              Divider(color: Colors.grey,thickness: 2,)


            ],
          ),
        );
    }
        },
      )









    );
  }
}
