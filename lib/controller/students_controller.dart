import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentsController extends GetxController {
  int step = 0;
  bool isLoading = false;

  TextEditingController name = TextEditingController(),
      address = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _initAllFields();
  }

  _initAllFields() {
    isLoading = false;
    name = TextEditingController();
  }

  Future goToNextPage() async {
    changeLoadingStatus(true);
    update();
    await Future.delayed(Duration(seconds: 2));
    changeLoadingStatus(false);
    step = 1;
    update();
  }

  Future getPrevious() async {
    changeLoadingStatus(true);
    await Future.delayed(Duration(seconds: 2));
    changeLoadingStatus(false);
    step = 0;
    update();
  }

  changeLoadingStatus(bool state) {
    isLoading = state;
    update();
  }
}
