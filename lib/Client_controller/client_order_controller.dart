import 'package:get/get.dart';
import 'package:websitesticker/const/consts.dart';

class ClientOrderController extends GetxController{

var orders=[];

getOrders(data){
  for(var item in data['orders']){
    if(item['seller_id']==currentUser!.uid){
      orders.add(item);
    }
  }
}

calculateBeforeTax(data){
  return data*0.93;
}
calculateTax(data){
  return data*0.07;
}
//
// UpdateOrderDetail()async{
//   var store=await firestore.collection(orderCollections).where('vendors',arrayContains: {currentUser!.uid}).;
//
// }


}