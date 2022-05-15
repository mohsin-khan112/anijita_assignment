import 'package:assigment/constant/shared_perefence_util.dart';
import 'package:assigment/model/user_create_response_model.dart';
import 'package:assigment/rest_api/user_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../get_user_details_screen.dart';

class CreateUserController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  RxBool emailValid = false.obs;
  RxBool nameValid = false.obs;
  UserCreateResponseModel? userCreateResponseModel;
  RxBool isErrorShow = false.obs;
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  final sharedPreferenceUtil = SharedPreferenceUtil.getInstance();


  RxString? genderRadioBtnVal = ''.obs;

  handleGenderChange(String value) {
    genderRadioBtnVal?.value = value;
  }

  emailValidation(String value) {
    isErrorShow.value =false;
    RegExp email = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
    if (email.hasMatch(value)) {
      emailValid.value = true;
    } else {
      emailValid.value = false;
    }
  }

  nameValidation(String value) {
    isErrorShow.value =false;
    if (value.isNotEmpty) {
      nameValid.value = true;
    } else {
      nameValid.value = false;
    }
  }

  void submitData() async {
    isErrorShow.value =false;
    isLoading.value = true;
    try {
      userCreateResponseModel = await UserApi.createUserApi(
          name: nameController.text,
          email: emailController.text,
          gender: genderRadioBtnVal!.value.toLowerCase());
      sharedPreferenceUtil.setString(SharedPreferenceUtil.login, userCreateResponseModel?.email);
      Get.to(const GetUserDetailsScreen());
      isLoading.value = false;
    }catch (err) {
      isLoading.value = false;
      isErrorShow.value =true;
      print('Errorss  : ${err.toString()}');
    }

  }
}
