import 'package:flutter/material.dart';
import 'package:simple_api_app/blocs/addUserBloc.dart';
import 'package:simple_api_app/view/new_user_setup.dart';
import 'package:simple_api_app/view/user_details_view.dart';

class HomePage extends StatefulWidget {
  @override
  _GetHomeState createState() => _GetHomeState();
}

class _GetHomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title:
              Text('Home', style: TextStyle(color: Colors.white, fontSize: 27)),
          backgroundColor: Color(0xFF333333),
        ),
        backgroundColor: Color(0xFF333333),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Text(
                  "Welcome!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 100),
                ),
                ButtonTheme(
                  minWidth: 150,
                  height: 70,
                  child: RaisedButton(
                    onPressed: () {
                      print("New User Button Pressed!!!");
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CreateNewUserPage()));
                    },
                    color: Colors.grey[600],
                    child: Text('New User',
                        style: TextStyle(fontSize: 27, color: Colors.white)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 70),
                ),
                ButtonTheme(
                  minWidth: 150,
                  height: 70,
                  child: RaisedButton(
                    onPressed: () {
                      print("Existing User Button Pressed!!!");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GetUserDetails()),
                    );
                    },
                    color: Colors.grey[600],
                    child: Text('View User',
                        style: TextStyle(fontSize: 27, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
