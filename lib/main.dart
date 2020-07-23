import 'package:flutter/material.dart';
import 'package:simple_api_app/view/home_screen.dart';
import 'package:simple_api_app/view/user_details_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Return Users',
        home: HomePage(),
        debugShowCheckedModeBanner: false); // define it once at root level.
  }
}