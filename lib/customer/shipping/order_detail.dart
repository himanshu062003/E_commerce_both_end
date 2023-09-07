import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websitesticker/common_widget/order_component_1.dart';
import 'package:websitesticker/common_widget/order_status.dart';
import 'package:websitesticker/const/consts.dart';
import 'package:websitesticker/services/firestore_services.dart';
import 'package:intl/intl.dart'as intl;
import '../Homescreenn/home.dart';

class orderdetailscreen extends StatelessWidget {
  final dynamic data;
  const orderdetailscreen({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: (){
          Get.to(()=>home());
        }, icon: Icon(Icons.arrow_back)),
        title: "Order Details".text.color(Colors.white).bold.make(),
      ),
      body:
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                orderStatus(
                  context: context,
                  color: pink_color,icon: Icons.done,title: "Placed",showDone: data['order_placed']
                ),
                orderStatus(
                    context: context,
                    color: blue_color,icon: Icons.thumb_up,title: "Confirmed",showDone: data['order_confirmed']
                ),
                orderStatus(
                    context: context,
                    color: Colors.yellow,icon: Icons.car_crash_outlined,title: "Delivery",showDone: data['order_on_delivery']
                ),
                orderStatus(
                    context: context,
                    color: Colors.purple,icon: Icons.done_all_outlined,title: "Delivered",showDone: data['order_delivered']
                ),
                Divider(),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.01,
                ),
               Card(

                 child: Column(
                   children: [
                     detail_order_part1(
                         d1: data['order_code'],
                         d2: data['shipping method'],
                         title1: "Order Code",
                         title2: "Shipping Method",
                         context: context
                     ),
                     detail_order_part1(
                         d1: intl.DateFormat().add_yMd().format((data['order_time'].toDate())),
                         d2: data['Payment_method'],
                         title1: "Order Date",
                         title2: "Payment Method",
                         context: context
                     ),
                     detail_order_part1(
                         d1:"Unpaid",
                         d2: "Order Placed",
                         title1: "Payment Status",
                         title2: "Delivery Status",
                         context: context
                     ),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("Shipping address",style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                 fontSize: 17
                               ),),
                               Text("${data['order_by_name']}"),
                               Text("${data['order_email']}"),
                               Text("${data['order_address']}"),
                               Text("${data['order_city']}"),
                               Text("${data['order_state']}"),
                               Text("${data['order_phonenumber']}"),
                               Text("${data['order_pincode']}")
                             ],
                           ),
                           SizedBox(
                             width: MediaQuery.of(context).size.width*0.34,
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Total amount",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                                 Text("${data['total_amount']}".numCurrency,style: TextStyle(
                                     color: pink_color
                                 ),)
                               ],
                             ),
                           )
                         ],
                       ),
                     )


                   ],
                 ),
               ),
                const Divider(),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.005,
                ),
                Text("Ordered Product",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.005,
                ),
                Card(
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(data['orders'].length, (index){
                      return detail_order_part1(
                        title1: data['orders'][index]['title'],
                        title2: "₹${data['orders'][index]['amount']}",
                        d1: "${data['orders'][index]['quantity']}x",
                        d2: "Refundable",
                        context: context
                      );
                    }).toList(),


                  ),

                ),
















              ],

            ),
          ),
        )


      //                10.heightBox,
      //                Align(
      //                    alignment: Alignment.topLeft,
      //                    child: "Purchase Details".text.size(20).bold.make()),
      //                10.heightBox,
      //                Container(
      //                  padding: EdgeInsets.all(10),
      //
      //                  margin: EdgeInsets.only(left: 12,right: 12),
      //
      //                  decoration: BoxDecoration(
      //
      //                      borderRadius: BorderRadius.circular(12),
      //                      border: Border.all(
      //
      //                          width: 1,
      //                          color: Colors.grey
      //                      )
      //                  ),
      //
      //                  child: Row(
      //                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                    children: [
      //                     // Image.network(data['p_images'],width: 50,),
      //                      "Mobile Cover".text.bold.size(18).make(),
      //                      50.widthBox,
      //                      "299".numCurrency.text.bold.make()
      //
      //                    ],
      //                  ),
      //
      //
      //
      //
      //                ),
      //                10.heightBox,
      //                Align(
      //                    alignment: Alignment.topLeft,
      //                    child: "Payment Details".text.size(20).bold.make()),
      //                10.heightBox,
      //                Container(
      //                  padding: EdgeInsets.all(10),
      //
      //                  margin: EdgeInsets.only(left: 12,right: 12),
      //
      //                  decoration: BoxDecoration(
      //
      //                      borderRadius: BorderRadius.circular(12),
      //                      border: Border.all(
      //
      //                          width: 1,
      //                          color: Colors.grey
      //                      )
      //                  ),
      //                  child: Column(
      //                    crossAxisAlignment: CrossAxisAlignment.start,
      //                    children: [
      //
      //                      "Payment Method".text.size(18).bold.make(),
      //
      //                    //  "${data['']}".text.size(17).make(),
      //
      //                      Divider(color: Colors.grey,),
      //
      //                      "Billing Address".text.size(18).bold.make(),
      //                      "FG-32,Jawahar Bhawan,IIT Roorkee".text.make(),
      //                      "ROORKEE".text.make(),
      //                      "UTTRAKHAND".text.make(),
      //                      "272001".text.make()
      //
      //                    ],
      //                  ),
      //
      //                ),
      //                10.heightBox,
      //                Align(
      //                    alignment: Alignment.topLeft,
      //                    child: "Order Summary".text.size(20).bold.make()),
      //                10.heightBox,
      //
      //                Container(
      //                  padding: EdgeInsets.all(10),
      //
      //                  margin: EdgeInsets.only(left: 12,right: 12),
      //
      //                  decoration: BoxDecoration(
      //
      //                      borderRadius: BorderRadius.circular(12),
      //                      border: Border.all(
      //
      //                          width: 1,
      //                          color: Colors.grey
      //                      )
      //                  ),
      //                  child: Row(
      //                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                    children: [
      //                      Column(
      //                        mainAxisAlignment: MainAxisAlignment.start,
      //                        children: [
      //                          "Items:".text.black.make(),
      //                          "Postage & Packing:".text.black.make(),
      //                          "Total before tax:".text.black.make(),
      //                          "Tax:".text.black.make(),
      //                          "Total:".text.black.make(),
      //                          "Order Total:".text.black.size(20).bold.make(),
      //                        ],
      //                      ),
      //                      Column(
      //                        mainAxisAlignment: MainAxisAlignment.start,
      //                        children: [
      //                          "253.59".numCurrency.text.black.make(),
      //                          "0".numCurrency.text.black.make(),
      //                          "253.59".numCurrency.text.black.make(),
      //                          "45.61".numCurrency.text.black.make(),
      //                          "299.00".numCurrency.text.black.make(),
      //                          "299.00".numCurrency.text.color(Colors.blue).black.size(20).bold.make(),
      //                        ],
      //                      ),
      //                    ],
      //                  ),
      //                )
      //
      //
      //
      //              ],
      //            ),
      //          ),
      //        );
      //
      //     }
      //
      //
      //     })




    );
  }
}
