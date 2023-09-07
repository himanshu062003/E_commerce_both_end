import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/consts.dart';

class ProductDetails extends StatelessWidget {
  final dynamic data;
  const ProductDetails({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("${data['p_name']}",style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: Column(
          children: [
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                  fit: BoxFit.cover,
                                )
                                    .box
                                    .rounded
                                    .clip(Clip.antiAlias)
                                    .margin(EdgeInsets.symmetric(horizontal: 8))
                                    .make();
                            }),
                        Divider(color: Colors.grey,thickness: 5),

                        "${data['p_name']}".text.size(18).fontWeight(FontWeight.w500).make(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.0125,
                        ),
                        VxRating(

                          value: double.parse(data['p_rating']),
                          isSelectable: false,
                          onRatingUpdate: (value) {},
                          normalColor: Colors.black,
                          selectionColor: Colors.blue,
                          count: 5,
                          size: 25,
                          stepInt: true,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.01,
                        ),
                        Text("Category: ${data['p_category']}",style: TextStyle(
                          fontSize: 16
                        ),),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.01,
                        ),
                        Text("Subcategory: ${data['p_subcategory']}",style: TextStyle(
                            fontSize: 16
                        ),),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.01,
                        ),
                        Divider(color: Colors.grey,thickness: 2),
                        "₹${data['p_price']}".text.color(Colors.red).size(18).fontWeight(
                            FontWeight.bold).make(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.01,
                        ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*0.2,
                                      child: "Color : ".text.size(18).fontWeight(
                                          FontWeight.bold).make(),
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
                                            //    controller.color_index(index);
                                              }),
                                              Visibility(
                                               //   visible: index==controller.colorindex.value,
                                                  child: Icon(Icons.done,color: Colors.white,))
                                            ],
                                          )),
                                    )
                                  ],
                                ).box.padding(EdgeInsets.all(8)).make(),
                                Divider(color: Colors.grey,thickness: 2),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: "Quantity :${data['p_quantity']} ".text.size(16).fontWeight(
                                          FontWeight.bold).make(),
                                    ),

                                  ],
                                ),



                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.0125,
                        ),

                        "Description :".text.size(16)
                            .fontWeight(FontWeight.bold)
                            .make(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.0125,
                        ),
                       Text( "${data['p_desc']}",style: TextStyle(
                         fontSize: 18
                       ),)




                      ],
                    ).box.white.make(),
                  )
              ),
            ),



          ]),
    );
  }
}
