import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websitesticker/button.dart';

import 'package:websitesticker/const/consts.dart';


import '../controller/product_controller.dart';
import 'chat_screen.dart';

class itemdetails extends StatelessWidget {
  final String? title;
  final dynamic data;
  const itemdetails({super.key,required this.title,required this.data});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(productcontroller());

    return WillPopScope(
      onWillPop: ()async {
        controller.resetvalues();
        return true;
      },
      child: Scaffold(

            appBar: AppBar(
              backgroundColor:Colors.white,
              leading: IconButton(icon: Icon(Icons.arrow_back,color: pink_color,),onPressed: (){
                controller.resetvalues();
                Get.back();
              },),

              title: Text(title!,style:const TextStyle(
                fontWeight: FontWeight.bold,color: pink_color
              ),),
              actions: [
                IconButton(onPressed: () {}, icon:const Icon(Icons.share,color: pink_color,)),
                Obx(
                    ()=> IconButton(onPressed: () {
                    if(controller.isfav.value){
                      controller.removeFromWishlist(data.id);
                      controller.isfav(false);
                    }else{
                      controller.addtoWishlist(data.id);
                      controller.isfav(true);
                    }
                  }, icon:controller.isfav.value? const Icon(Icons.favorite,color: Colors.red):const Icon(Icons.favorite_outline,color: Colors.black)),
                ),
              ],
            ),
            body: Column(
                children: [
                  Expanded(
                    child:  SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height:MediaQuery.of(context).size.height*0.01 ,
                            ),
                            VxSwiper.builder(
                                aspectRatio: 16 / 9,
                                autoPlay: true,
                                height: MediaQuery.of(context).size.height*0.45,
                                enlargeCenterPage: true,
                                viewportFraction: 1.0,
                                itemCount: data['p_images'].length,
                                itemBuilder: (context, index) {
                                  return
                                    Image
                                        .network(data['p_images'][index],
                                      fit: BoxFit.contain,
                                    )
                                        .box
                                        .rounded
                                        .clip(Clip.antiAlias)
                                        .margin(EdgeInsets.symmetric(horizontal: 8))
                                        .make();
                                }),
                         const Divider(color:Colors.grey,thickness: 5),

                             Padding(
                               padding: const EdgeInsets.only(left: 8.0),
                               child: title!.text.size(18).fontWeight(FontWeight.normal).make(),
                             ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.0125,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: VxRating(
                                value: double.parse(data['p_rating']),
                                isSelectable: false,
                                onRatingUpdate: (value) {},
                                normalColor: Colors.black,
                                selectionColor: pink_color,
                                count: 5,
                                size: 25,
                                stepInt: true,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.0125,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: "₹${data['p_price']}".text.color(pink_color).size(18).fontWeight(
                                  FontWeight.bold).make(),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.0125,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: "available : ${data['p_quantity']} ".text.size(16)
                                .make(),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.0125,
                            ),
                            Container(
                              color: pink_color,
                              child: ListTile(
                                leading: IconButton(onPressed: (){
                                  Get.to(()=>ChatScreen(title: data['seller_name'],),
                                      arguments: [
                                      data['seller_name'],data['seller_id']
                                      ]
                                  );
                                },icon:const Icon(Icons.message,color: Colors.white,),),
                                title: Text("Sold by ${data['seller_name']}",style:const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold
                                              ),),
                              ),
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.025,
                            ),
                            Obx(()=>
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*0.25,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: "Color : ".text.size(18).fontWeight(
                                              FontWeight.bold).make(),
                                        ),
                                      ),
                                      Row(
                                        children: List.generate(3, (index) =>
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                VxBox()
                                                    .size(40, 40)
                                                    .roundedFull
                                                    .color(Vx.randomPrimaryColor)
                                                    .margin(
                                                   const EdgeInsets.symmetric(horizontal: 6))
                                                    .make().onTap(() {
                                                      controller.color_index(index);
                                                }),
                                                Visibility(
                                                    visible: index==controller.colorindex.value,
                                                    child: const Icon(Icons.done,color: Colors.white,))
                                              ],
                                            )),
                                      ),

                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*0.0125,
                                  ),
                                  const Divider(color: Colors.grey,thickness: 1),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*0.2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: "Quantity : ".text.size(16).fontWeight(
                                              FontWeight.bold).make(),
                                        ),
                                      ),
                                      Obx(()=>
                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              IconButton(onPressed: () {
                                                controller.deccrement_quantity();
                                                controller.calculatetotal_price(int.parse(data['p_price']));
                                              },
                                                  icon: Icon(Icons.remove)),
                                              controller.quantity.value.text.size(16)
                                                 .make(),
                                              IconButton(onPressed: () {
                                                controller.increment_quantity();
                                                controller.calculatetotal_price(int.parse(data['p_price']));
                                              },
                                                  icon: Icon(Icons.add)),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width*0.05,
                                            ),

                                            ]
                                        ),
                                      )
                                    ],
                                  ),

                                     Padding(
                                       padding: const EdgeInsets.only(left: 8.0),
                                       child: Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width*0.2,
                                              child: "Total :".text.size(16).fontWeight(
                                                  FontWeight.bold).make(),
                                            ),
                                            "₹${controller.totalprice.value}".text.size(16).fontWeight(
                                                FontWeight.bold).size(16).make(),
                                          ]
                                    ),
                                     ),
                                const  Divider(color: Colors.grey,thickness: 1),

                                ],
                              ),
                            ),
                           SizedBox(
                             height: MediaQuery.of(context).size.height*0.0125,
                           ),

                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: "Description".text.size(16)
                                  .fontWeight(FontWeight.bold)
                                  .make(),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.0125,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: "${data['p_desc']}"
                                  .text
                                  .make(),
                            ),
                         const Divider( color: Colors.grey,thickness: 2),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.0125,
                          ),
                          const  Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text("Write reviews",style: TextStyle(

                              ),),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.00125,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                              child: TextFormField(
                                maxLines: 4,
                                decoration: const InputDecoration(
                                  hintText: "type your review..",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.00125,
                            ),
                            ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: List.generate(descri.length, (index) =>
                                  Container(
                                    margin: EdgeInsets.only(left: 8,right: 8),
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      border:Border.all(
                                        color: Colors.grey
                                      )
                                    ),
                                    child: ListTile(
                                      title: descri[index].text.size(16).fontWeight(
                                          FontWeight.bold).make(),
                                      trailing: Icon(Icons.arrow_forward),


                                    ),
                                  )
                              ),

                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.02,
                            ),
                            prodcutyoumaylike.text.size(16).fontWeight(FontWeight.bold).make(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.0125,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(women_clothing.length, (index) => Column(
                                  children: [
                                    Image.asset(women_clothing[index],height:200,fit: BoxFit.cover,),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height*0.0125,
                                    ),
                                    women_clothing_name[index].text.fontWeight(FontWeight.bold).make(),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.0125,
                                ),
                                    Align(alignment: Alignment.centerLeft,
                                        child: "\$69".text.color(Colors.blue).fontWeight(FontWeight.bold).size(16).make())
                                  ],
                                ).box.white.margin( const EdgeInsets.symmetric(horizontal: 4)).roundedSM.width(180).padding(EdgeInsets.all(8)).make()),
                              ),
                            ),
                          ],
                        ).box.white.make(),
                      )
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: buttonbox(
                        "Add to Cart", pink_color, Colors.white, () {
                          if(controller.quantity.value>0){
                            controller.addtocart(
                              title: data['p_name'],
                              img: data['p_images'][0],
                              seller_id:data['seller_id'],
                              price: controller.totalprice.value,
                              quantity: controller.quantity.value,
                              context: context,
                            );
                            VxToast.show(context, msg: "Added to cart");
                          }else{
                            VxToast.show(context, msg: "You have choosen 0 quantity");
                          }

                    }),
                  )
                ])

      ),
    );
  }

  }

