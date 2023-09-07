import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websitesticker/client/client_order/order_detail_client.dart';
import 'package:websitesticker/const/consts.dart';
import 'package:websitesticker/services/client_services.dart';
import '../../const/images.dart';
import 'package:intl/intl.dart' as intl;

class ClientOrderscreen extends StatelessWidget {
  const ClientOrderscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink_color,
        title:const Text("Orders",style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
      ),
      body:StreamBuilder(
        stream: ClientServices.getorders(currentUser!.uid),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(snapshot.data!.docs.isEmpty){
            return const Center(
              child: Text("You have 0 orders"),
            );
          }
          else{
            var data=snapshot.data!.docs;
            return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: List.generate(data.length, (index){
                    var time=data[index]['order_time'].toDate();
                    var time_order=intl.DateFormat().add_yMd().format(time);

                    return Card(
                      color: blue_color,
                    elevation: 1.2,
                    child: ListTile(
                      onTap: (){
                        Get.to(()=>OrderDetails(data: data[index]));
                      },

                      title:Text("Order Code:${data[index]['order_code']}",style:const TextStyle(
                          fontWeight: FontWeight.bold,
                      ),),
                      subtitle: Column(
                        children: [
                          Row(
                            children: [
                             const Icon(Icons.calendar_month),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.01,
                              ),
                              Text(time_order,style: const TextStyle(
                                fontSize: 16,
                              ),),

                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.001,
                          ),
                          Row(
                            children: [
                           const  Icon(Icons.payment),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.01,
                              ),
                              Text("${data[index]['order_paid']}",style: const TextStyle(
                                  fontSize: 16,
                                color: Colors.red
                              ),),

                            ],
                          ),
                        ],
                      ),
                      trailing:Text("₹ ${data[index]['total_amount']}",style:const TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 18,
                        color: Colors.red
                      ),),

                    ),
                  );
    }
                ),
                ) ),
            );
          }
        },
      )

    );
  }
}
