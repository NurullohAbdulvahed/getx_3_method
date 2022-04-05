import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_3_method/models/post_model.dart';
import 'package:getx_3_method/services/http_service.dart';
import 'package:getx_3_method/services/log_service.dart';



class CreateController extends GetxController {
 TextEditingController titleController =TextEditingController();
 TextEditingController bodyController = TextEditingController();


  void apiCreatePost(BuildContext context) async{
    String title = titleController.value.text.toString().trim();
    String body = bodyController.value.text.toString().trim();
    Post post =Post(title: title, body: body, userId: body.hashCode);

    var result = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    if(result != null){
      Get.back(result: result);
    }
    else{
      Log.e("Something went wrong");
    }
  }
}