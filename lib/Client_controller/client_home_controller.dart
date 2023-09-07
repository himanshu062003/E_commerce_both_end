import 'package:get/get.dart';
import 'package:websitesticker/const/consts.dart';

class ClientHomeController extends GetxController{

    @override
  void onInit() {
    getUsername();
    super.onInit();
  }

  var currentnavindex=0.obs;
  // var boolexit=false.obs;
  var username="";

  getUsername()async{
    var name= await firestore.collection(usersCollection).where('id',isEqualTo: currentUser!.uid).get().then((value)
    {
      if(value.docs.isNotEmpty){
        return value.docs.single['name'];
      }
    }
    );
    username=name;
  }

}
