import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:websitesticker/common_widget/backgroundcommon.dart';
import 'package:websitesticker/const/consts.dart';
import 'package:get/get.dart';

import '../controller/product_controller.dart';
import 'categorydetails.dart';


class Categoryscreen extends StatelessWidget {
  const Categoryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(productcontroller());
    return
      Scaffold(
           appBar: AppBar(
             actions: [
               IconButton(onPressed: (){}, icon: Icon(Icons.search))
             ],
             backgroundColor:pink_color,
             title: "Categories".text.color(Colors.white).fontWeight(FontWeight.bold).make(),
           ),
        body:
           SingleChildScrollView(
            scrollDirection: Axis.vertical,
              child:   Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                  ),
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: allcategories_name.length,

                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 300), itemBuilder: (context,index){

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(allcategories[index],width: MediaQuery.of(context).size.width*0.4,height:MediaQuery.of(context).size.height*0.2,fit: BoxFit.cover),

                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.025,
                        ),
                        allcategories_name[index].text.fontWeight(FontWeight.bold).make()

                      ],
                    ).box.white.margin( const EdgeInsets.symmetric(horizontal: 4)).border(color: Colors.grey).roundedSM.width(MediaQuery.of(context).size.width*0.35).padding(const EdgeInsets.all(12)).make().onTap(() {
                      controller.getsubcategories(allcategories_name[index]);
                               Get.to(()=>categorydetail(title: allcategories_name[index]));
                    });
                  }),
                ],
              ),




          ),





    );
  }
}
