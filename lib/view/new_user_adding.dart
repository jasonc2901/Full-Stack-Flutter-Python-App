import 'package:simple_api_app/CustomAlert/CustomAlertDialog.dart';
import 'package:simple_api_app/blocs/addUserBloc.dart';
import 'package:flutter/material.dart';
import 'package:simple_api_app/models/PostUserModel.dart';
import 'package:simple_api_app/networking/Response.dart';

class SendUserToAPI extends StatefulWidget {
  final String username;
  final String firstname;
  final String lastname;
  final String email;
  final String password;
  final String imageurl;

  const SendUserToAPI(this.username, this.firstname, this.lastname, this.email,
      this.password, this.imageurl);

  @override
  _SendUserToAPIState createState() => _SendUserToAPIState();
}

class _SendUserToAPIState extends State<SendUserToAPI> {
  AddUserBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = AddUserBloc(widget.username, widget.firstname, widget.lastname,
        widget.email, widget.password, widget.imageurl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        title: Text('Adding User ...',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: Color(0xFF333333),
      ),
      backgroundColor: Color(0xFF333333),
      body: RefreshIndicator(
        onRefresh: () => _bloc.postUserDetails(
            widget.username,
            widget.firstname,
            widget.lastname,
            widget.password,
            widget.email,
            widget.imageurl),
        child: StreamBuilder<Response<PostUserModel>>(
          stream: _bloc.userDataStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data.status) {
                case Status.LOADING:
                  return Loading(loadingMessage: snapshot.data.message);
                  break;
                case Status.COMPLETED:
                  return UserSuccess(displayUser: snapshot.data.data);
                  break;
                case Status.ERROR:
                  String error = snapshot.data.message;

                  if (error.contains("No User found")) {
                    error = "No User Found!";
                  }

                  if (error.contains("User already exists")) {
                    error = "User already exists";
                  }

                  if (error.contains("Email already signed up!")) {
                    error = "Email already signed up!";
                  }

                  print("Error Simplified: " + error.toString());
                  return Error(
                    errorMessage: error,
                    onRetryPressed: () => _bloc.postUserDetails(
                        widget.username,
                        widget.firstname,
                        widget.lastname,
                        widget.password,
                        widget.email,
                        widget.imageurl),
                  );
                  break;
              }
            }
            return Container();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}

class UserSuccess extends StatelessWidget {
  final PostUserModel displayUser;

  const UserSuccess({Key key, this.displayUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF333333),
      body: Container(
        child: CustomDialog(
          title: 'SUCCESS!',
          description: "${displayUser.user.username} Added to DB.",
          buttonText: "Okay",
          alertImage: "assets/tick.png",
          buttonColor: Colors.green[400],
        ),
      ),
    );
  }
}

class Error extends StatelessWidget {
  final String errorMessage;

  final Function onRetryPressed;

  const Error({Key key, this.errorMessage, this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          SizedBox(height: 8),
          RaisedButton(
            color: Colors.white,
            child: Text('Retry', style: TextStyle(color: Colors.black)),
            onPressed: onRetryPressed,
          )
        ],
      ),
    );
  }
}

class Loading extends StatelessWidget {
  final String loadingMessage;

  const Loading({Key key, this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            loadingMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 24),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ],
      ),
    );
  }
}
