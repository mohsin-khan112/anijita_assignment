
import 'package:assigment/util/material_button.dart';
import 'package:assigment/util/text_field_widget.dart';
import 'package:assigment/view/controller/create_user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({Key? key}) : super(key: key);

  @override
  _CreateUserScreenState createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateUserController>(
        init: CreateUserController(),
        builder: (controller) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(
                  left: 22, right: 22, top: 20, bottom: 8),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFieldWidget(
                      controller: controller.nameController,
                      cursorColors: Colors.black,
                      textStyle: textStyle(Colors.black54, FontWeight.w600, 18),
                      hintTextStyle:
                          textStyle(Colors.grey, FontWeight.w600, 16),
                      placeholderText: 'Enter Your  Name',
                      maxLine: 1,
                      onChanged: (value) {
                        controller.nameValidation(value);
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFieldWidget(
                        controller: controller.emailController,
                        cursorColors: Colors.black,
                        textStyle:
                            textStyle(Colors.black54, FontWeight.w600, 18),
                        hintTextStyle:
                            textStyle(Colors.grey, FontWeight.w600, 16),
                        placeholderText: 'Enter Email Id',
                        maxLine: 1,
                        onChanged: (value) {
                          controller.emailValidation(value);
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                    radioButton(controller),
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(() => MaterialButtonWidget(
                          width: 350,
                          child: controller.isLoading.value == true
                              ? const SizedBox(
                                  width: 26,
                                  height: 26,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                )
                              : Text(
                                  'Create User',
                                  style: textStyle(
                                      Colors.white, FontWeight.w600, 18),
                                ),
                          onTap: controller.emailValid.value == true &&
                                  controller.nameValid.value == true &&
                                  controller.genderRadioBtnVal!.value.isNotEmpty
                              ? () async {
                                  controller.submitData();
                                }
                              : null,
                        )),
                    Obx(
                      () => Visibility(
                        visible: controller.isErrorShow.value,
                        child: const Text('Email has already been taken',
                            style: TextStyle(color: Colors.red)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget radioButton(CreateUserController controller) {
    return Obx(() => Row(
          children: <Widget>[
            const Text("Gender"),
            const SizedBox(
              width: 20,
            ),
            Radio<String>(
              value: "Male",
              groupValue: controller.genderRadioBtnVal?.value.toString(),
              onChanged: (value) {
                controller.handleGenderChange(value!);
              },
            ),
            const Text("Male"),
            Radio<String>(
              value: "Female",
              groupValue: controller.genderRadioBtnVal?.value.toString(),
              onChanged: (value) {
                controller.handleGenderChange(value!);
              },
            ),
            const Text("Female"),
          ],
        ));
  }

// Widget dropDownButton(CreateUserController controller) {
//   return Container(
//     height: 64,
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         color: Colors.white,
//         border: Border.all(color: AppColors.primaryColor)),
//     padding: const EdgeInsets.only(left: 16),
//     child: DropdownButton<String?>(
//       focusColor: Colors.white,
//       value: controller.dropDownValue?.value,
//       isExpanded: true,
//    /*   icon: const Icon(Icons.keyboard_arrow_down),*/
//       underline: Container(height: 1),
//       style: const TextStyle(
//           color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w600),
//       selectedItemBuilder: (BuildContext context) {
//         return controller.dropDownList.map((String value) {
//           return Container(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               controller.dropDownValue?.value ?? '',
//               style: const TextStyle(
//                   color: Colors.blue,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600),
//             ),
//           );
//         }).toList();
//       },
//       iconEnabledColor: Colors.black,
//       items: controller.dropDownList.map<DropdownMenuItem<String?>>((value) {
//         return DropdownMenuItem<String?>(
//           value: value,
//           child:Obx(() => Text(value,style: const TextStyle(fontWeight: FontWeight.w300))
//
//         ));
//       }).toList(),
//       onChanged: (String? value) {
//         controller.dropDownUpdateValue(value!);
//       },
//     ),
//   );
// }
}
