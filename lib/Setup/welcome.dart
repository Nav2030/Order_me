import 'package:flutter/material.dart';


class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sun View Beach Hotel'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: navigateToSignIn,
            child: Text('Sign In'),
          ),
          RaisedButton(
            onPressed: navigateToSignUp,
            child: Text('Sign Up'),
          ),
        ],
      ),
    );
  }

  void navigateToSignIn(){
  }
  void navigateToSignUp(){

  }
}
