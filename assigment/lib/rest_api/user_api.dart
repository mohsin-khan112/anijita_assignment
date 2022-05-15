import 'dart:convert';

import 'package:assigment/model/get_user_details_model.dart';
import 'package:assigment/model/user_create_response_model.dart';
import 'package:assigment/rest_api/rest_api.dart';
import 'package:dio/dio.dart';

class UserApi {
  static Future<UserCreateResponseModel?> createUserApi(
      {required String name,
      required String email,
      required String gender}) async {
    String token =
        'c3bda044dd81de96170faa30ca0a7eb467e0d743964a5c141e8493014d984547';

    var dio = Dio();

    Map<String, dynamic> request = {
      "name": name,
      "email": email,
      "gender": gender,
      "status": "active"
    };
    print('inside name :${name}, gender ${gender}, email${email}');

    final response =
        await dio.post('${RestAPI.API_BASE_URL}${RestAPI.createUserApi}',
            options: Options(headers: {
              'Authorization': 'Bearer $token',
            }),
            data: request);
    print('inside the response :${response.statusCode}');
    if (response.statusCode == 200 || response.statusCode ==201) {
      print('response ${response.data}');
      var data = UserCreateResponseModel.fromJson(response.data);
      return data;
    } else {
      throw Exception("Testing");
    }
  }

  Future<List<GetUserDetailsModel>?> getUserListAPI(int page) async {
    List<GetUserDetailsModel> userList = [];
    var dio = Dio();
    String token =
        'c3bda044dd81de96170faa30ca0a7eb467e0d743964a5c141e8493014d984547';
    final response = await dio.get(
      '${RestAPI.API_BASE_URL}${RestAPI.getUserDetailsApi}$page',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      data.forEach((element) {
        userList.add(GetUserDetailsModel.fromJson(element));
      });
      return userList;
    }
  }
}
