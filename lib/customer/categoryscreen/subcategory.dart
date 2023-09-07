import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websitesticker/common_widget/custom_item_card.dart';
import 'package:websitesticker/const/colors.dart';
import 'package:websitesticker/const/consts.dart';
import 'package:websitesticker/services/client_services.dart';
import 'package:websitesticker/services/firestore_services.dart';

import 'item_details.dart';

class SubCategoryDetail extends StatelessWidget {
  final String title_subcat;
  final String title_cat;

  const SubCategoryDetail({super.key,required this.title_subcat,required this.title_cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink_color,
        title: Text(title_subcat,style:const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
      ),
      body:
      StreamBuilder(
        stream: FirestoreServices.getParticularproducts(title_cat, title_subcat),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return const Center(
              child: Text("Loading..",style: TextStyle(
                fontWeight: FontWeight.bold,
              ),),
            );
          }
          else{
            var data=snapshot.data!.docs;
            if(data.isEmpty){
              return const Center(
                child: Text("No product available",style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
              );
            }
            else{
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.025,
                    ),
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: MediaQuery.of(context).size.height*0.4), itemBuilder: (context,index){
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(data[index]['p_images'][0],width: double.infinity,height:MediaQuery.of(context).size.height*0.2,fit: BoxFit.contain),
                            Divider(color: Colors.grey,),
                            VxRating(
                              value: double.parse(data[index]['p_rating']),
                              isSelectable: false,
                              onRatingUpdate: (value) {},
                              normalColor: Colors.black,
                              selectionColor: pink_color,
                              count: 5,
                              size: 20,
                              stepInt: true,
                            ),
                            "${data[index]['p_name']}".text.fontWeight(FontWeight.bold).make(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.0125,
                            ),
                            "₹${data[index]['p_price']}".text.color(pink_color).fontWeight(FontWeight.bold).size(16).make()
                          ],
                        ).box.white.border(color: Colors.grey).roundedSM.width(MediaQuery.of(context).size.width*0.35).padding( EdgeInsets.all(12)).make().onTap(() {
                          Get.to(()=>itemdetails(title: data[index]['p_name'],data: data[index]));
                        }),
                      );
                    }),
                  ],
                ),
              );
            }
          }

        },
      )

    );
  }
}
