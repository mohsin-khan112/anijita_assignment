import 'dart:async';

import 'package:assigment/constant/shared_perefence_util.dart';
import 'package:assigment/view/create_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'get_user_details_screen.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 1), onClose);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  void onClose() async {
    final sharedPreferenceUtil = SharedPreferenceUtil.getInstance();
    String? token =
    await sharedPreferenceUtil.getString(SharedPreferenceUtil.login);
    Navigator.pop(context);
    if (token != null) {
      Get.to(const GetUserDetailsScreen());
    } else {
      Get.to(const CreateUserScreen());
    }
  }
}
