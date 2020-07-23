import 'package:simple_api_app/networking/CustomException.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

class ApiProvider {
  //EMULATOR ADDRESS
  final String _baseUrl = "http://10.0.2.2:5000/";

  
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      String responsestring = _baseUrl + url;
      print("Response URL: " + responsestring);
      final response = await http.get(_baseUrl + url);
      responseJson = _response(response);
    } on SocketException{
      throw FetchDataException('Server is down');
    }
    return responseJson;
  }

  Future<dynamic> post(String url,String username, String firstname, String lastname, String password,
  String email, String imageUrl) async {
    var responseJson;
    try {
      String responsestring = _baseUrl + url;
      print("Response URL: " + responsestring);
      final response = await http.post(
        _baseUrl + url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'first_name': firstname,
          'last_name': lastname,
          'password': password,
          'email_address': email,
          'image_url': imageUrl
        }),
      );
      responseJson = _response(response);
    } on SocketException{
      throw FetchDataException('Server is down');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
