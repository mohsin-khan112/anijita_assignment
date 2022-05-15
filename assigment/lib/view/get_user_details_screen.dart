import 'package:assigment/constant/shared_perefence_util.dart';
import 'package:assigment/util/label_with_icon_widget.dart';
import 'package:assigment/util/text_field_widget.dart';
import 'package:assigment/view/create_user_screen.dart';
import 'package:assigment/view/stories_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/get_user_controller.dart';

class GetUserDetailsScreen extends StatefulWidget {
  const GetUserDetailsScreen({Key? key}) : super(key: key);

  @override
  _GetUserDetailsScreenState createState() => _GetUserDetailsScreenState();
}

class _GetUserDetailsScreenState extends State<GetUserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetUserController>(
        init: GetUserController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title:  Text('User List Screen',style: textStyle(Colors.black,FontWeight.normal,20),),
              backgroundColor: Colors.white,
              elevation: 1,
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () async {
                      Get.to(const StoriesScreen());
                    },
                    child: LabelFieldWidget(
                      textLabel: 'Next',
                      textStyle: textStyle(Colors.black, FontWeight.w600, 16),
                      iconColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: InkWell(
                    onTap: () async {
                      SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                      sharedPreferences.remove(SharedPreferenceUtil.login);
                      Navigator.pop(context);
                      Get.to(const CreateUserScreen());
                    },
                    child: LabelFieldWidget(
                      textLabel: 'Logout',
                      textStyle: textStyle(Colors.black, FontWeight.w600, 16),
                      iconColor: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            body: controller.allUserDetailsList !=null ?
            Padding(
                padding: const EdgeInsets.only(
                    left: 22, right: 22, top: 20, bottom: 8),
                child: Column(
                  children: [
                    Obx(() => Expanded(
                          child: NotificationListener<ScrollEndNotification>(
                            onNotification: (t) {
                              final metrics = t.metrics;
                              if (metrics.atEdge) {
                                bool isTop = metrics.pixels == 0;
                                if (isTop) {
                                  print('At the top');
                                } else {
                                  controller.page.value =
                                      controller.page.value + 1;
                                  controller.paginationSingleMessageListData();
                                }
                              }

                              return true;
                            },
                            child: Scrollbar(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: ListView.separated(
                                    itemCount: controller.allUserDetailsList!.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    controller
                                                        .allUserDetailsList![index]
                                                        .name!,
                                                    style: textStyle(Colors.black,
                                                        FontWeight.normal, 20),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 30,
                                                ),
                                                Text(
                                                  controller
                                                      .allUserDetailsList![index].id
                                                      .toString(),
                                                  style: textStyle(Colors.black,
                                                      FontWeight.w300, 20),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          const Divider(
                                            color: Colors.grey,
                                            height: 1,
                                          )
                                        ],
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(
                                        height: 16,
                                      );
                                    },
                                  ),
                                )),
                          ),
                        )),
                    Obx(
                      () => Visibility(
                        visible: controller.isLoading.value,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )
                  ],
                )): const Center(child: CircularProgressIndicator(color: Colors.blue,),),
          );
        });
  }
}
