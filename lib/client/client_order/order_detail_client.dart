import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:websitesticker/Client_controller/client_order_controller.dart';
import 'package:websitesticker/button.dart';
import 'package:intl/intl.dart' as intl;
import 'package:websitesticker/const/colors.dart';
import 'package:websitesticker/const/consts.dart';

class OrderDetails extends StatefulWidget {
  final dynamic data;
  const OrderDetails({super.key,required this.data});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();

}

class _OrderDetailsState extends State<OrderDetails> {

  var controller=Get.put(ClientOrderController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getOrders(widget.data);
  }

  @override
  Widget build(BuildContext context) {


    var time=widget.data['order_time'].toDate();
    var time_order=intl.DateFormat().add_yMd().format(time);


    return Scaffold(
       backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: pink_color,
        title:const Text("Order Details",style: TextStyle(
          fontWeight: FontWeight.bold,color: Colors.white
        ),),
      ),
      bottomNavigationBar:Container(
          color: pink_color,
        child:buttonbox("Confirm Order", pink_color, Colors.white, (){})
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
                    Card(
                    color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.01,
                            ),
                            const Text("Order Status",style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                            ),),

                          const Divider(color: Colors.black),
                            SwitchListTile(
                              activeColor: pink_color,


                                value: widget.data['order_placed'],
                                onChanged: (value){},
                              title:const Text("Placed",style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),),

                            ),
                            SwitchListTile(
                              activeColor: pink_color,

                              value: widget.data['order_confirmed'],
                              onChanged: (value){},
                              title:const Text("Confirmed",style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),),

                            ),
                            SwitchListTile(
                              activeColor: pink_color,
                              value: widget.data['order_on_delivery'],
                              onChanged: (value){},
                              title:const Text("On Delivery",style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),),

                            ),
                            SwitchListTile(
                              activeColor: pink_color,
                              value: widget.data['order_delivered'],
                              onChanged: (value){},
                              title:const Text("Delivered",style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),),

                            ),
                          ],
                        ),
                      ),
                    ),
              //
              Column(
                children: [
                  SizedBox(
                    height:MediaQuery.of(context).size.height*0.01,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: "View order details".text.size(20).bold.make()),
                  SizedBox(
                    height:MediaQuery.of(context).size.height*0.01,
                  ),
                  Card(
                   color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween
                        ,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              "Order Code :".text.bold.size(15).make(),
                           const Text("Placed on :",style: TextStyle(fontSize: 15
                              ,
                              fontWeight: FontWeight.bold),),
                              "Order total :".text.size(15).bold.make(),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                               Text("${widget.data['order_code']}",style:const TextStyle(
                                 fontSize: 15,
                                 fontWeight: FontWeight.bold
                               ),),

                              Text(time_order,style:const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                              ),),
                              Text("₹${widget.data['total_amount']}",style:const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                              ),)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.height*0.01,
                  ),

                  Align(
                      alignment: Alignment.topLeft,
                      child: "Payment Details".text.size(20).bold.make()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.0125,
                  )  ,
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Payment Method".text.size(18).bold.make(),
                          "${widget.data['Payment_method']}".text.size(17).make(),
                          Divider(color: Colors.grey,),
                          "Billing Address".text.size(18).bold.make(),
                          "${widget.data['order_address']}".text.make(),
                          "${widget.data['order_city']}".text.make(),
                          "${widget.data['order_state']}".text.make(),
                          "${widget.data['order_pincode']}".text.make()

                        ],
                      ),
                    ),
                  ),
                   SizedBox(
                     height: MediaQuery.of(context).size.height*0.0125,
                   )  ,
                  Align(
                      alignment: Alignment.topLeft,
                      child: "Order Summary".text.size(20).bold.make()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.0125,
                  )  ,

                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              "Items:".text.black.make(),
                              "Postage & Packing:".text.black.make(),
                              "Total before tax:".text.black.make(),
                              "Tax:".text.black.make(),
                              "Total:".text.black.make(),
                              "Order Total:".text.black.size(20).bold.make(),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              controller.calculateBeforeTax(widget.data['total_amount']).toString().numCurrency.text.black.make(),
                              "0".numCurrency.text.black.make(),
                              controller.calculateBeforeTax(widget.data['total_amount']).toString().numCurrency.text.black.make(),
                              controller.calculateTax(widget.data['total_amount']).toString().numCurrency.text.black.make(),
                              "${widget.data['total_amount']}".numCurrency.text.black.make(),
                              "${widget.data['total_amount']}".numCurrency.text.color(Colors.blue).black.size(20).bold.make(),
                            ],
                          ),
                        ],
                      ),
                    ),
                   )
                ],
              ),

              SizedBox(
                height:MediaQuery.of(context).size.height*0.01,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: "Orders".text.size(20).bold.make()),
              Card(
                child: ListView.builder(
                  shrinkWrap: true,
                    itemCount: controller.orders.length,
                    itemBuilder: (context,index){
                      return ListTile(
                        leading: Text(index.toString(),style:const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22
                        ),),
                        title: Text("${widget.data['orders'][index]['p_name']}"),
                        subtitle: Text("Price :"+"${widget.data['orders'][index]['p_price']}".numCurrency,style:const TextStyle(
                          color: Colors.red
                        ),),
                      );
                    })
              )
             ],
           ),
         ),
      ),
    );
  }
}
