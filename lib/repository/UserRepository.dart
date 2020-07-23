import 'package:simple_api_app/models/PostUserModel.dart';
import 'package:simple_api_app/networking/ApiProvider.dart';
import 'package:simple_api_app/models/UserModel.dart';
import 'dart:async';

class UserRepository {
  ApiProvider _provider = ApiProvider();

  Future<UserModel> fetchUserData(String username) async {
    final response = await _provider.get("api/user?username=" + username);
    return UserModel.fromJson(response);
  }

  Future<PostUserModel> postUserData(String username, String firstname, String lastname, String password,
  String email, String imageUrl) async {
    final response = await _provider.post("api/user", username, firstname, lastname, password, email, imageUrl);
    return PostUserModel.fromJson(response);
  }

}