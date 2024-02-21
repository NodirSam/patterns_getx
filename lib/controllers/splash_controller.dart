import 'package:get/get.dart';
import 'package:patterns_getx/model/post_model.dart';
import 'package:patterns_getx/services/http_service.dart';

class SplashController extends GetxController{
  var isLoading = false.obs;
  var items = [].obs;

  void apiPostList() async {
    isLoading.value = true;
     var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
     if(response != null){
       items.value = Network.parsePostList(response);
     }else{
       items.value   = [];
     }
     isLoading.value = false;
  }

  void apiPostDelete(Post post) async {
    isLoading.value = false;
    var response = Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if(response != null){
      apiPostList();
    }
  }

}