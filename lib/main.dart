import 'package:flutter/material.dart';
import 'package:system_for_hotel_mobile_app/Setup/welcome.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Sun View Beach Hotel',
      theme: ThemeData(
        primaryColor: Color(0xff0e0923),
      ),
      home: WelcomePage(),
    );
  }
}
