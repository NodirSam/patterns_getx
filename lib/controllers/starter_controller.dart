import 'package:get/get.dart';
import 'package:patterns_getx/services/http_service.dart';

import '../model/post_model.dart';

class StarterController extends GetxController{
  var isLoading = false;
  var items = [];

  void apiPostList() async {
    isLoading = true;
    update();  //qiymatini o'zgartirib qo'y degani

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if(response != null){
      items = Network.parsePostList(response);
    }else{
      items = [];
    }
    isLoading = false;
    update();
  }

  void apiPostDelete(Post post){
    isLoading = true;
    update();

    var response = Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if(response != null){
      apiPostList();
    }
  }
}