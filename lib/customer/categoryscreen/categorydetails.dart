import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:websitesticker/common_widget/backgroundcommon.dart';
import 'package:websitesticker/const/consts.dart';
import 'package:websitesticker/customer/categoryscreen/subcategory.dart';

import 'package:websitesticker/services/firestore_services.dart';

import '../controller/product_controller.dart';
import 'item_details.dart';


class categorydetail extends StatelessWidget {

  final String? title;
  const categorydetail({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<productcontroller>();

    return bgwidget(
      Scaffold(
     appBar: AppBar(
       backgroundColor: pink_color,
       title:title!.text.color(Colors.white).fontWeight(FontWeight.bold).make() ,
     ),
         body: StreamBuilder(
           stream: FirestoreServices.getproducts(title),
           builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
             if(!snapshot.hasData){
               return  const Center(
                 child: CircularProgressIndicator(
                   valueColor: AlwaysStoppedAnimation(pink_color),
                 ),
               );
             }
             else{
               var data=snapshot.data!.docs;
               return 
               Container(
                 padding:const EdgeInsets.all(12),
                   child: SingleChildScrollView(
                     scrollDirection: Axis.vertical,
                     child: Column(
                       children: [
                           GridView.builder(
                              physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                 itemCount: controller.subcat.length,
                                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context,index){
                                 return Container(
                                   padding: EdgeInsets.all(8),
                                   height: MediaQuery.of(context).size.height*0.1,
                                   margin: EdgeInsets.all(12),
                                   decoration: BoxDecoration(
                                     gradient:const LinearGradient(
                                       begin: Alignment.topCenter,
                                         end: Alignment.bottomCenter,
                                         colors: [
                                      pink_color,
                                           blue_color
                                     ]
                                     ),
                                     borderRadius: BorderRadius.all(Radius.circular(12)),
                                     border: Border.all(
                                       color: Colors.grey
                                     )
                                   ),
                                   child:
                                       Align(
                                         alignment: Alignment.center,
                                         child: Text("${controller.subcat[index]}",style:const TextStyle(
                                         fontSize: 24,
                                         color: Colors.white,
                                         fontWeight: FontWeight.bold
                                       ),),),

                                ).onTap(() {
                                  Get.to(()=>SubCategoryDetail(title_subcat: controller.subcat[index],title_cat: title.toString(),));
                                 });
                              }),

                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.025,
                        ),
                        const  Divider(
                            color: blue_color,
                            thickness: 2,
                          ),
                       const Text("Featured Products",style: TextStyle(
                           fontSize: 22,
                           fontWeight: FontWeight.bold
                         ),),

                          Container(
                            padding: EdgeInsets.all(12),

                            child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                 shrinkWrap: true,
                                 itemCount: data.length,

                                itemBuilder: (context,index){
                               return SingleChildScrollView(
                                 scrollDirection: Axis.vertical,
                                 child:  Card(
                                    color: Colors.white,
                                     child:
                                         ListTile(
                                           onTap: (){
                                             controller.checkifFav(data[index]);
                                             Get.to(()=>itemdetails(title: data[index]['p_name'],data: data[index]));
                                           },
                                           leading: Image.network(data[index]['p_images'][0],fit: BoxFit.contain,width: MediaQuery.of(context).size.width*0.15,),
                                           title: Text("${data[index]['p_name']}"),
                                           subtitle: Text("₹${data[index]['p_price']}"),
                                   ),

                               ));
                             }),
                          )

                       ],
                     ),
                   ),

               );
             }

           },

         )
        //
        //
       
        ),




    );
  }
}
