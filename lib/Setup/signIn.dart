import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:system_for_hotel_mobile_app/Pages/home.dart';
import 'package:system_for_hotel_mobile_app/Setup/sign_up.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email,_password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body:Stack(
        children: <Widget>[
          Image.asset(
            'assets/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height : double.infinity,
          ),
          Container(
            color: Color(0xff0e0923).withOpacity(0.68),
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/logo.png',
              width: 150.0,
              height: 200.0,
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(top :200.0),
              child: Center(
                child:  Form(
                  key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(padding: const EdgeInsets.only(left:12.0),
                              child:  TextFormField(
                                validator: (input){
                                  if(input.isEmpty){
                                    return 'Please type your email address';
                                  }
                                  },
                                onSaved: (input) => _email = input,
                                decoration: InputDecoration(
                                    icon: Icon(Icons.alternate_email),
                                    hintText: "Email",
                                ),
                                obscureText: false,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(padding: const EdgeInsets.only(left:12.0),
                              child:  TextFormField(
                                validator: (input){
                                  if(input.length < 6){
                                    return 'Please provide password at least 6 characters';
                                  }
                                },
                                onSaved: (input) => _password = input,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.lock_outline),
                                  hintText: "Password",
                                ),
                                obscureText: true,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Color(0xffff9000).withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(padding: const EdgeInsets.only(left:12.0),
                              child: MaterialButton(
                                minWidth: MediaQuery.of(context).size.width,
                                onPressed: signIn,
                                child: new Text(
                                  "Sign In",
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Forgot Password ?',
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage()));
                            },
                            child: RichText(
                                text: TextSpan(
                                    style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: "Don't have an account ? click here to "
                                      ),
                                      TextSpan(
                                          text: "Sign Up",
                                          style: TextStyle(color: Color(0xffff9000))
                                      )
                                    ]
                                )),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
        ],
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
