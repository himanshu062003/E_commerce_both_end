import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websitesticker/const/consts.dart';
import 'package:websitesticker/customer/Homescreenn/home.dart';

import '../../button.dart';
import '../controller/cart_controller.dart';
import '../orderplaced_screen/order_placed.dart';


class Paymentscreen extends StatelessWidget {
  const Paymentscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<Cartcontroller>();
    return Scaffold(
      bottomNavigationBar:controller.placemyOrder.value? Center(
        child: CircularProgressIndicator(
        ),
      ) :buttonbox("Place My Order", pink_color, Colors.white, () async{
       await controller.placedmyorder(orderpaymentmethod: paymentmethodname[controller.paymentindex.value],
           totalprice: controller.totalprice.value);
       VxToast.show(context, msg: "successfully placed");
       await controller.clearCart();
          Get.offAll(()=>home());
           // Get.to(()=>orderplacedscreen());
      }),
      appBar: AppBar(
        title:const Text("Payment Method",style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Obx(
            ()=> Column(
            children: List.generate(paymentmethondimg.length, (index) {
              return GestureDetector(
                onTap: (){
                  controller.chngepaymentindex(index);
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: controller.paymentindex==index ? Colors.red:Colors.transparent,
                      width: 4
                    )
                  ),
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.asset(
                        paymentmethondimg[index],
                        colorBlendMode: controller.paymentindex==index? BlendMode.darken :BlendMode.color,
                        color: controller.paymentindex==index? Colors.black.withOpacity(0.4): Colors.transparent,
                        width: double.infinity,
                        height: 130,
                        fit: BoxFit.cover,),
                   controller.paymentindex.value==index ?
                   Transform.scale(
                       scale: 1.3,
                       child: Checkbox(
                         activeColor: Colors.green,
                           shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(50)
                       ),value: true, onChanged: (value){}),
                     ) :Container(),
                      Positioned(
                        bottom: 10,
                          right: 10,
                          child: paymentmethodname[index].text.white.fontWeight(FontWeight.bold).make())

                    ],
                  ),
                ),
              );
            }


            ),
          ),
        ),
      ),
    );
  }
}
