import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:system_for_hotel_mobile_app/Setup/signIn.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email,_password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (input){
                  if(input.isEmpty){
                    return 'Please Type an email';
                  }
                },
                onSaved: (input) => _email = input,
                decoration: InputDecoration(
                    labelText: 'Email'
                ),
              ),
              TextFormField(
                validator: (input){
                  if(input.length < 6){
                    return 'Please provide password at least 6 characters';
                  }
                },
                onSaved: (input) => _password = input,
                decoration: InputDecoration(
                    labelText: 'Password'
                ),
                obscureText: true,
              ),
              RaisedButton(
                onPressed: signUp,
                child: Text('Sign Up'),
              ),
            ],
          )),
    );
  }
  Future<void> signUp() async{
    final formState  = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        user.sendEmailVerification();
        Navigator.of(context).pop();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),fullscreenDialog: true));
      }
      catch(e){
        print(e.message);
      }
    }
  }
}
