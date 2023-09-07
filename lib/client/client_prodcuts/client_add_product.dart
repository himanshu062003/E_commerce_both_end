import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websitesticker/Client_controller/client_product_controller.dart';
import 'package:websitesticker/common_widget/dropdown_lit.dart';
import 'package:websitesticker/const/consts.dart';
import '../../common_widget/project_images.dart';

class ClientAddProduct extends StatelessWidget {
  const ClientAddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<ClientProductController>();

    return Obx(
        ()=> Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon:const Icon(Icons.arrow_back,color: Colors.white,)),
          actions: [
            controller.isLoading.value ? Center(
              child: CircularProgressIndicator(),
            ):
            TextButton(onPressed: ()async{
              controller.isLoading(true);
              await controller.UploadImage();
              await controller.UploadProduct(context);
              Get.back();
            }, child:const Text("Save",style: TextStyle(
        fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white
      ),))

          ],
          backgroundColor: pink_color,
          title:const Text("Add your product",style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white

          ),),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.productNameController,
              decoration:const InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),

                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(
                      color: blue_color
                    )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                          color: pink_color
                      )
                  ),
                  hintText: "Product Name"
              ),
            ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.0125,
              ),
              TextFormField(
                controller: controller.productPriceController,
                decoration:const InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                            color: blue_color
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                            color: pink_color
                        )
                    ),

                    hintText: "Price"
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.0125,
              ),
              TextFormField(
                controller: controller.productQuantityController,
                decoration:const InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                            color: blue_color
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                            color: pink_color
                        )
                    ),

                    hintText: "Quantity"
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.0125,
              ),
              TextFormField(
                controller: controller.productDescriptionController,
                minLines: 2,
                maxLines: 3,
                decoration:const InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                            color: blue_color
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                            color: pink_color
                        )
                    ),

                    hintText: "Description"
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.0125,
              ),
              ProductDropDownList("Category",controller.categoryList, controller.categoryvalue,controller),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.0125,
              ),
              ProductDropDownList("Subcategory",controller.subcategoryList, controller.subcategoryvalue,controller),

              SizedBox(
                height: MediaQuery.of(context).size.height*0.0125,
              ),
            const Text("Choose Colors if applicable",style: TextStyle(
                fontSize: 16
              ),),
              Obx(
                ()=>Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: List.generate(9, (index) => Stack(
                    alignment: Alignment.center,
                    children: [
                      VxBox().color(Vx.randomPrimaryColor).roundedFull.size(MediaQuery.of(context).size.height*0.05,MediaQuery.of(context).size.width*0.1).make().onTap(() {
                        controller.selectedcolorIndex.value=index;
                      }),
                      controller.selectedcolorIndex.value==index?
                      Icon(Icons.done,color: Colors.white,):
                          SizedBox()
                    ],
                  ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.0125,
              ),
              const Text("Choose Images",style: TextStyle(
                  fontSize: 16
              ),),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.006,
              ),
              Obx(
                ()=>Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(3, (index) =>
                  controller.prodcutImageList[index]!=null?
                      Image.file(controller.prodcutImageList[index]!,width: MediaQuery.of(context).size.width*0.3,height: MediaQuery.of(context).size.height*0.13).onTap(() {
                        controller.pickImage(index, context);
                      }):
                      productImages(label:"${index+1}",

                   context: context).onTap(() {
                        controller.pickImage(index, context);
                      })
                  ),
                ),
              )

            ],
            ),
          ),
        ),

      ),
    );
  }
}
