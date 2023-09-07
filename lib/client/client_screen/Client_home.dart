import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:websitesticker/Client_controller/client_home_controller.dart';

import '../../common_widget/exitdialog.dart';

import '../client_dashboard/dashboard.dart';
import '../client_message/messages.dart';
import '../client_order/orders.dart';
import '../client_prodcuts/product.dart';

class HomeClient extends StatelessWidget {
  const HomeClient({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(ClientHomeController());
    var navbaritem=[
      const BottomNavigationBarItem(icon:Icon(Icons.dashboard),label: "Dashborad"),
      const BottomNavigationBarItem(icon:Icon(Icons.message),label: "Messages"),
      const BottomNavigationBarItem(icon:Icon(Icons.add_box_sharp),label: "Products"),
      const BottomNavigationBarItem(icon:Icon(Icons.production_quantity_limits),label: "Orders"),
    ];
    var navbody=
    [
      const ClientDashboradscreen(),const ClientMessagescreen(),const ClientProductscreen(),const ClientOrderscreen()
    ];
    return  WillPopScope (
      onWillPop: () async{
        showDialog(
            barrierDismissible: false,
            context: context, builder: (context) => exitDialog(context));
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            Obx(()=> Expanded(child: navbody.elementAt(controller.currentnavindex.value),)),
          ],
        ),
        bottomNavigationBar: Obx(()=>

            BottomNavigationBar(
              unselectedItemColor:  Color.fromRGBO(102, 199, 244,1),
              currentIndex: controller.currentnavindex.value,
              selectedItemColor:  Color.fromRGBO(249, 98, 125,1),
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              type :BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              items: navbaritem,
              onTap: (value){
                controller.currentnavindex.value=value;
              },

            ),
        ),


      ),
    );
  }
}
