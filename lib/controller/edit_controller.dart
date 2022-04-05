import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_3_method/models/post_model.dart';
import 'package:getx_3_method/services/http_service.dart';
import 'package:getx_3_method/services/log_service.dart';


class EditController extends GetxController{
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  Post? _post;

  void editPagePost(Post post) {
    _post = post;
    update();
    titleController.text =_post?.title ?? "No Data";
    bodyController.text = _post?.body ?? "No Data";
  }
  void apiEditData(BuildContext context) async{
    String title = titleController.text.toString().trim();
    String body = bodyController.text.toString().trim();
    if(_post != null){
      Post post = Post(id: _post!.id, title: title, body: body, userId: body.length);
      String? result = await Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));
      if(result != null) {
        Get.back(result: result);
      } else {
        Log.e("Error");
      }

    }
  }

}