import 'package:flutter/material.dart';
// import 'package:simple_api_app/blocs/UserBloc.dart';
// import 'package:simple_api_app/networking/Response.dart';
// import 'package:simple_api_app/models/UserModel.dart';
import 'package:simple_api_app/view/home_screen.dart';
import 'package:simple_api_app/view/show_user.dart';
// import 'package:simple_api_app/view/user_details_view.dart';
import 'package:simple_api_app/CustomAlert/CustomAlertDialog.dart';

class GetUserDetails extends StatefulWidget {
  @override
  _GetUserState createState() => _GetUserState();
}

class _GetUserState extends State<GetUserDetails> {
  final usernameController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Text('User Details',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          backgroundColor: Color(0xFF333333),
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              })),
      backgroundColor: Color(0xFF333333),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 60, left: 10),
              child: Text(
                "Enter Username",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10, bottom: 20),
              child: new TextFormField(
                controller: usernameController,
                validator: (val) => val.length < 2 ? 'Still too short' : null,
                decoration: new InputDecoration(
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.grey,
                  filled: true,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                ),
                keyboardType: TextInputType.text,
                style: new TextStyle(
                  fontFamily: "Calibri",
                  color: Colors.white,
                ),
              ),
            ),
            FloatingActionButton(
                onPressed: () {
                  if (usernameController.text.length > 0) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ShowUserPage(usernameController.text)));
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CustomDialog(
                          title: 'Cannot leave field empty!',
                          description: "Please enter a valid username.",
                          buttonText: "Okay",
                          alertImage: "assets/x.png",
                          buttonColor: Colors.red[700],
                        );
                      },
                    );
                  }
                },
                tooltip: 'Show user!',
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
