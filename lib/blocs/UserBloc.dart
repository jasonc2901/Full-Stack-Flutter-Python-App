
import 'dart:async';
import 'package:simple_api_app/networking/Response.dart';
import 'package:simple_api_app/repository/UserRepository.dart';
import 'package:simple_api_app/models/UserModel.dart';

class UserBloc {
  UserRepository _userRepository;
  StreamController _userDataController;

  StreamSink<Response<UserModel>> get userDataSink =>
      _userDataController.sink;

  Stream<Response<UserModel>> get userDataStream =>
      _userDataController.stream;

  UserBloc(String username) {
    _userDataController = StreamController<Response<UserModel>>();
    _userRepository = UserRepository();
    fetchUserDetails(username);
  }

  fetchUserDetails(String username) async {
    userDataSink.add(Response.loading('Fetching User Details!'));
    try {
      UserModel userDetails = await _userRepository.fetchUserData(username);
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
