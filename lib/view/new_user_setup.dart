import 'package:flutter/material.dart';
import 'package:simple_api_app/CustomAlert/CustomAlertDialog.dart';
import 'package:simple_api_app/blocs/addUserBloc.dart';

import 'home_screen.dart';
import 'new_user_adding.dart';

class CreateNewUserPage extends StatefulWidget {
  @override
  _CreateNewUserState createState() => _CreateNewUserState();
}

class _CreateNewUserState extends State<CreateNewUserPage> {
  AddUserBloc _bloc;
  final usernameController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final imageURLController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    imageURLController.dispose();

    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Text('New User',
              style: TextStyle(color: Colors.white, fontSize: 27)),
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
      body: ListView(children: <Widget>[
        Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: Text(
                    "Enter Username",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 100, right: 100),
                  child: Container(
                    height: 40,
                    child: new TextFormField(
                      controller: usernameController,
                      validator: (val) =>
                          val.length < 2 ? 'Still too short' : null,
                      decoration: new InputDecoration(
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.grey,
                        filled: true,
                      ),
                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        fontFamily: "Calibri",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: Text(
                    "Enter First name",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 100, right: 100),
                  child: Container(
                    height: 40,
                    child: new TextFormField(
                      controller: firstnameController,
                      validator: (val) =>
                          val.length < 2 ? 'Still too short' : null,
                      decoration: new InputDecoration(
                        hintText: 'First Name',
                        hintStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.grey,
                        filled: true,
                      ),
                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        fontFamily: "Calibri",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: Text(
                    "Enter Last name",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 100, right: 100),
                  child: Container(
                    height: 40,
                    child: new TextFormField(
                      controller: lastnameController,
                      validator: (val) =>
                          val.length < 2 ? 'Still too short' : null,
                      decoration: new InputDecoration(
                        hintText: 'Last Name',
                        hintStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.grey,
                        filled: true,
                      ),
                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        fontFamily: "Calibri",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: Text(
                    "Enter Email",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 100, right: 100),
                  child: Container(
                    height: 40,
                    child: new TextFormField(
                      controller: emailController,
                      validator: (val) =>
                          val.length < 2 ? 'Still too short' : null,
                      decoration: new InputDecoration(
                        hintText: 'Email Address',
                        hintStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.grey,
                        filled: true,
                      ),
                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        fontFamily: "Calibri",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: Text(
                    "Enter Password",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 100, right: 100),
                  child: Container(
                    height: 40,
                    child: new TextFormField(
                      controller: passwordController,
                      validator: (val) =>
                          val.length < 2 ? 'Still too short' : null,
                      decoration: new InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.grey,
                        filled: true,
                      ),
                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        fontFamily: "Calibri",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60, left: 100, right: 100),
                  child: ButtonTheme(
                    minWidth: 200,
                    height: 60,
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey[600])),
                      child: Text(
                        "Save User!",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      onPressed: () {
                        print("User Saved!");
                        String username = usernameController.text;
                        String firstname = firstnameController.text;
                        String lastname = lastnameController.text;
                        String password = passwordController.text;
                        String emailaddress = emailController.text;
                        String imageurl = "";
                        if (username.length < 1 ||
                            firstname.length < 1 ||
                            lastname.length < 1 ||
                            password.length < 1 ||
                            emailaddress.length < 1) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomDialog(
                                  title: 'Blank field!',
                                  description:
                                      "Please ensure fields are filled.",
                                  buttonText: "Okay",
                                  alertImage: "assets/x.png",
                                  buttonColor: Colors.red[700],
                                );
                              });
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SendUserToAPI(
                                  username,
                                  firstname,
                                  lastname,
                                  password,
                                  emailaddress,
                                  imageurl)));
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
