import 'package:simple_api_app/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:simple_api_app/blocs/UserBloc.dart';
import 'package:simple_api_app/networking/Response.dart';


class ShowUserPage extends StatefulWidget {
  final String selectedUsername;

  const ShowUserPage(this.selectedUsername);

  @override
  _ShowUserPageState createState() => _ShowUserPageState();
}

class _ShowUserPageState extends State<ShowUserPage> {
  UserBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = UserBloc(widget.selectedUsername);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        title: Text('User Page',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: Color(0xFF333333),
      ),
      backgroundColor: Color(0xFF333333),
      body: RefreshIndicator(
        onRefresh: () => _bloc.fetchUserDetails(widget.selectedUsername),
        child: StreamBuilder<Response<UserModel>>(
          stream: _bloc.userDataStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data.status) {
                case Status.LOADING:
                  return Loading(loadingMessage: snapshot.data.message);
                  break;
                case Status.COMPLETED:
                  return UserDetails(displayUser: snapshot.data.data);
                  break;
                case Status.ERROR:
                  String error = snapshot.data.message;

                  if (error.contains("No User found")){
                    error = "No User Found!";
                  }

                  print("Error Simplified: " + error.toString());
                  return Error(
                    errorMessage: error,
                    onRetryPressed: () =>
                        _bloc.fetchUserDetails(widget.selectedUsername),
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

class UserDetails extends StatelessWidget {
  final UserModel displayUser;

  const UserDetails({Key key, this.displayUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child: new Stack(
          children: <Widget>[
            _getBackground(),
            _getContent(),
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return new Container(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF333333)
        ),
      ),
    );
  }

  Widget _getContent() {
    return new ListView(
      padding: new EdgeInsets.fromLTRB(0.0, 100, 0.0, 32.0),
      children: <Widget>[
        new Container(
          margin: EdgeInsets.all(70.0),
          decoration: BoxDecoration(
              color: Colors.grey[600],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0))),
          padding: new EdgeInsets.symmetric(horizontal: 32.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: new Container(
                  margin: EdgeInsets.fromLTRB(5, 15, 0.0, 0.0),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: new NetworkImage(
                        displayUser.data.imageUrl
                      ),
                    ),
                  ),
                ),
              Center(
                child: new Padding(
                  padding: const EdgeInsets.only(top:15.0, bottom: 15),
                  child: Text(
                    "First Name: " + displayUser.data.firstName + "\n\nLast Name: " + displayUser.data.lastName + "\n\nEmail Address: " + displayUser.data.emailAddress,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
