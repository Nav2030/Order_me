import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:system_for_hotel_mobile_app/Pages/home.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email,_password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
          key: _formKey,
          child: Container(
            color: Color(0xff0e0960),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
              SizedBox(
                height: 155.0,
                child: Image.asset(
                  "assets/logo.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 45.0),
              TextFormField(
                validator: (input){
                  if(input.isEmpty){
                    return 'Please type your email address';
                  }
                },
                onSaved: (input) => _email = input,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Email',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Email",
                    border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                ),
                obscureText: false,
                style: style,
              ),
              SizedBox(height: 25.0),
              TextFormField(
                validator: (input){
                  if(input.length < 6){
                    return 'Please provide password at least 6 characters';
                  }
                },
                onSaved: (input) => _password = input,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Password',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Password",
                    border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                ),
                obscureText: true,
                style:style,
              ),
              SizedBox(
                height: 35.0,
              ),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(30.0),
                color: Color(0xffff9000),
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  onPressed: signIn,
                  child: new Text(
                    "Sign In",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
            ],
          )),
        ),
      ),
    );
  }
  Future<void> signIn() async{
    final formState  = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user : user )));
      }
      catch(e){
        print(e.message);
      }
    }
  }
}
