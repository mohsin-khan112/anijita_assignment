import 'package:assigment/model/get_user_details_model.dart';
import 'package:assigment/rest_api/user_api.dart';
import 'package:get/get.dart';

class GetUserController extends GetxController {
  List<GetUserDetailsModel>? userDetailsList = [];

  RxList<GetUserDetailsModel>? allUserDetailsList = <GetUserDetailsModel>[].obs;
  RxInt page = 0.obs;
  RxBool isLoading= false.obs;
  final RxBool isListMoreRequire = true.obs;

  @override
  void onInit() async{
    super.onInit();
   await userListData();
  }

  paginationSingleMessageListData() {
    if (isListMoreRequire.value) {
      if (!isLoading.value) {
        userListData();
        isLoading.value = true;
      }
    }
  }

  userListData() async {
    int paginationPage =  page.value+1;
    UserApi userListAPI = UserApi();
    userDetailsList = await userListAPI.getUserListAPI(paginationPage);
    if(userDetailsList!.isNotEmpty){
      allUserDetailsList?.addAll(userDetailsList!);
    } else{
      isListMoreRequire.value = false;
    }
    isLoading.value = false;

  }
}
