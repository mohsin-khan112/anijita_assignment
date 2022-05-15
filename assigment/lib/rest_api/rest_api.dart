class RestAPI {
  static const String API_BASE_URL = "https://gorest.co.in";

  static const int STATUS_CODE_0K = 200;
  static const int STATUS_CODE_CREATED = 201;
  static const int STATUS_CODE_UNAUTHORIZED = 401;
  static const int STATUS_CODE_BAD_REQUEST = 400;
  static const int STATUS_CODE_CONFLICTS = 409;

  ///API End Points
  static const String createUserApi = "/public/v2/users";
  static const String getUserDetailsApi = "/public/v2/users?page=";

}
