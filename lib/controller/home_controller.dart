import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_3_method/pages/create_page.dart';
import 'package:getx_3_method/pages/edit_page.dart';
import 'package:getx_3_method/services/http_service.dart';
import '../models/post_model.dart';


class HomeController extends GetxController{
  bool isLoading = false;
  List<Post>  items =[];

  Future<void> apiPostList() async {
    isLoading = true;
    update();
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      _showResponse(response!),
    });
  }

  void _showResponse(String response) {
    List<Post> list = Network.parsePostList(response);
    items.clear();
    isLoading = false;
    items = list;
    update();

  }

  void apiPostDelete(Post post) async {
    isLoading = true;
    update();
    var response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if (response != null) {
      items.remove(post);
    }
    isLoading = false;
    update();

  }

  void goToCreatePage(BuildContext context) async{
    String result = await Get.to(() => const CreatePage());
    items.add(Network.parsePost(result));


  }


  void goToEditPage(Post post,BuildContext context) async{
    String? result =await Get.to(() => EditPage(post: post,));
    if(result != null){
      Post newPost = Network.parsePost(result);
      items[items.indexWhere((element) => element.id == newPost.id)] = newPost;
    }
  }
}