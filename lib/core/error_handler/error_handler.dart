import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ErrorHandle {
  showSnakeBar(String errorMessage){
    Get.snackbar("ERROR", errorMessage);
  }
}