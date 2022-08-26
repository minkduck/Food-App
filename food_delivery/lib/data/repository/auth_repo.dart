import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/models/signup_body_models.dart';
import 'package:food_delivery/utils/app_constraints.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences
});

  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(AppConstrants.REGISTRATION_URI, signUpBody.toJson());
  }

  saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstrants.TOKEN, token);
  }
}