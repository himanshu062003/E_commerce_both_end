
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websitesticker/Client_controller/client_product_controller.dart';
import 'package:websitesticker/client/client_prodcuts/client_add_product.dart';
import 'package:websitesticker/client/client_prodcuts/product_client_detail.dart';
import 'package:websitesticker/common_widget/list.dart';
import 'package:websitesticker/const/consts.dart';
import 'package:websitesticker/services/client_services.dart';

class ClientProductscreen extends StatelessWidget {
  const ClientProductscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(ClientProductController());
    return Scaffold(

      appBar:
      AppBar(
        backgroundColor:pink_color,
        title:const Text("Products",style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
      ),
      body:
          StreamBuilder(
            stream: ClientServices.getproducts(currentUser!.uid),
            builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
              if(!snapshot.hasData){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              else if(snapshot.data!.docs.isEmpty){
                return const Center(
                  child: Text("Add Products in your Online Shop"),
                );
              }
              else{
                var data=snapshot.data!.docs;
                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.0125,
                        ),
                        const  Text("All Products",style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),),
                        const Divider(
                          color: pink_color,
                          thickness: 2,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.0125,
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            itemCount: data.length,
                             itemBuilder:(context,index){
                          return
                                Card(
                                  color: blue_color,
                                  child: ListTile(
                                    leading:  Image.network("${data[index]['p_images'][0]}",height: MediaQuery.of(context).size.height*0.1),
                                    title: Text("${data[index]['p_name']}"),
                                    titleTextStyle: TextStyle(
                                    color: Colors.black
                                    ),
                                    subtitle:Text("₹${data[index]['p_price']}",style:const TextStyle(
                                      color: Colors.red,
                                      fontSize: 18
                                    ),),
                                    trailing: VxPopupMenu(
                                      
                                      menuBuilder: ()=>Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(12)),
                                          color: Colors.white
                                        ),
                                        child: Column(
                                          children: List.generate(popupMenuTitles.length, (index) => IconButton(onPressed: (){
                                            switch(index){
                                              case 0:


                                                break;
                                                case 1:
                                                  controller.removeProduct(data[index].id);
                                                  VxToast.show(context, msg: "Product Removed");
                                                  break;


                                            }
                                          }, icon: Icon(popupMenuIcon[index])))

                                          
                                        ),
                                      ),
                                      clickType: VxClickType.singleClick,
                                      child: Icon(Icons.more_vert),
                                    ),
                                    
                                  ),

                              // Column(
                              //   children: [
                              //     Image.network("${data[index]['p_images'][0]}",height: MediaQuery.of(context).size.height*0.15,
                              //       fit: BoxFit.fitHeight,),
                              //     SizedBox(
                              //       height: MediaQuery.of(context).size.height*0.0125,
                              //     ),
                              //
                              //     SizedBox(
                              //       height: MediaQuery.of(context).size.height*0.0125,
                              //     ),
                              //     Align(
                              //       alignment: Alignment.centerLeft,
                              //         child: ,style:const TextStyle(
                              //           color: Colors.blue,
                              //           fontSize: 18
                              //         ),))
                              //   ],
                              // ),
                           // ),
                          ).onTap(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(data: data[index])));
                          });
                        }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisExtent: MediaQuery.of(context).size.height*0.1
                        ),)
                      ],
                    ),
                  ),
                );
              }
            },
          ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: ()async{
         await controller.getCategories();
         controller.populateCategoryList();

          Get.to(()=>ClientAddProduct());
        },
        child: Icon(Icons.add,color: pink_color,),
      ),
    );
  }
}
