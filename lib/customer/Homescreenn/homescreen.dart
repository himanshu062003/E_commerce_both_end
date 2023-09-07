
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websitesticker/common_widget/homebutton.dart';
import 'package:websitesticker/const/consts.dart';
import 'package:websitesticker/customer/categoryscreen/item_details.dart';
import 'package:websitesticker/services/firestore_services.dart';



class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: pink_color,
        title:  Container(
          height:60,
          child: TextFormField(
            decoration:const InputDecoration(

                border: InputBorder.none,
                suffixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                hintText: searchany
            ),
          ).box.roundedFull.outerShadowSm.make(),
        ),
      ),

          body:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
               child: Column(
                 children: [

                   SizedBox(
                     height: MediaQuery.of(context).size.height*0.025,
                   ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [

                         VxSwiper.builder(
                                aspectRatio: 16/9,
                                autoPlay: true,
                                height: MediaQuery.of(context).size.height*0.2,
                                enlargeCenterPage: true,
                                itemCount: women_dress.length, itemBuilder: (context,index){
                              return
                                Image.asset(women_dress[index],
                                  fit:BoxFit.fitWidth,
                                ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();

                            }),

                         SizedBox(
                           height: MediaQuery.of(context).size.height*0.04,
                         ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List.generate(3, (index) => Homebutton(context.screenWidth/3.5, context.screenHeight*0.12,
                                  index==0
                                      ? Icons.category
                                      : index==1
                                      ? Icons.design_services
                                      :Icons.person,
                                  index==0
                                      ? topcategories
                                      : index==1
                                      ? brand
                                      : topsellers,


                                      (){},context))
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.025,
                          ),
                          VxSwiper.builder(
                              aspectRatio: 16/9,
                              autoPlay: true,
                              height: MediaQuery.of(context).size.height*0.2,
                              enlargeCenterPage: true,
                              itemCount: men_dress.length, itemBuilder: (context,index){
                            return
                              Image.asset(men_dress[index],
                                fit:BoxFit.fitWidth,
                              ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();

                          }),

                         SizedBox(
                           height: MediaQuery.of(context).size.height*0.025,
                         ),
                          Divider(),
                          Text("All Products",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.025,
                          ),
                          StreamBuilder(stream: FirestoreServices.getallProducts(), builder:(BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot){
                            if(!snapshot.hasData){
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }else{
                              var allproductdata=snapshot.data!.docs;
                              return GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: allproductdata.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: MediaQuery.of(context).size.height*0.35), itemBuilder: (context,index){
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(allproductdata[index]['p_images'][0],width: double.infinity,height:MediaQuery.of(context).size.height*0.2,fit: BoxFit.contain),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height*0.025,
                                    ),
                                   " ${allproductdata[index]['p_name']}".text.make(),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height*0.0125,
                                    ),
                                    "₹${allproductdata[index]['p_price']}".text.color(pink_color).fontWeight(FontWeight.bold).size(16).make()
                                  ],
                                ).box.white.shadowSm.margin( const EdgeInsets.symmetric(horizontal: 4)).roundedSM.width(MediaQuery.of(context).size.width*0.35).padding(const EdgeInsets.all(12)).make().onTap(() {
                                  Get.to(()=>itemdetails(title: "${allproductdata[index]['p_name']}", data:allproductdata[index]));
                                });
                              });
                            }
                          }),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.025,
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                             width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              color: pink_color,
                              border:Border.all(
                                color: Colors.grey
                              )
                            ),
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                featuredproduct.text.color(Colors.white).fontWeight(FontWeight.bold).size(18).make(),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.025,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child:StreamBuilder(
                                    stream: FirestoreServices.getFeaturedproducts(),
                                    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
                                      if(!snapshot.hasData){
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }else if(snapshot.data!.docs.isEmpty){
                                        return const Center(
                                          child: Text("No feautured products today"),
                                        );
                                      }
                                      else{
                                        var featureddata=snapshot.data!.docs;
                                        return Row(
                                          children: List.generate(featureddata.length, (index) => Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Image.network("${featureddata[index]['p_images'][0]}",height: 100,fit: BoxFit.contain,),
                                              SizedBox(
                                                height: MediaQuery.of(context).size.height*0.025,
                                              ),
                                              "${featureddata[index]['p_name']}".text.fontWeight(FontWeight.bold).make(),
                                              SizedBox(
                                                height: MediaQuery.of(context).size.height*0.025,
                                              ),

                                              "₹${featureddata[index]['p_price']}".text.color(pink_color).fontWeight(FontWeight.bold).size(16).make()
                                            ],
                                          ).box.white.margin( const EdgeInsets.symmetric(horizontal: 4)).roundedSM.width(MediaQuery.of(context).size.width*0.4).border(color:Colors.grey).padding(const EdgeInsets.all(8)).make()),
                                        );
                                      }
                                    },
                                  )


                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.025,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.025,
                          ),
                          VxSwiper.builder(
                              aspectRatio: 16/9,
                              autoPlay: true,
                              height: MediaQuery.of(context).size.height*0.2,
                              enlargeCenterPage: true,
                              itemCount: homenutirtion.length, itemBuilder: (context,index){
                            return
                              Image.asset(homenutirtion[index],
                                fit:BoxFit.fitWidth,
                              ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();

                          }),















                        ],
                      ),
                    ),
                  )
                 ],
               ),
             ),
        ),

    );











  }
}
