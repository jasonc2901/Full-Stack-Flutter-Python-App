import 'dart:async';
import 'package:simple_api_app/models/PostUserModel.dart';
import 'package:simple_api_app/networking/Response.dart';
import 'package:simple_api_app/repository/UserRepository.dart';


class AddUserBloc {
  UserRepository _userRepository;
  StreamController _userDataController;

  StreamSink<Response<PostUserModel>> get userDataSink =>
      _userDataController.sink;

  Stream<Response<PostUserModel>> get userDataStream =>
      _userDataController.stream;

  AddUserBloc(String username, String firstname, String lastname, String password,
  String email, String imageUrl) {
    _userDataController = StreamController<Response<PostUserModel>>();
    _userRepository = UserRepository();
    postUserDetails(username, firstname, lastname, password, email, imageUrl);
  }

  postUserDetails(String username, String firstname, String lastname, String password,
  String email, String imageUrl) async {
    userDataSink.add(Response.loading('Posting User Details!'));
    try {
      PostUserModel userDetails = await _userRepository.postUserData(username,firstname,lastname,password,email,imageUrl);
      userDataSink.add(Response.completed(userDetails));
    } catch (e) {
      userDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _userDataController?.close();
  }
}