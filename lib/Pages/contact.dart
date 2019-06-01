import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Contact Us',
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          color: Colors.orange,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: ListTile(
                          title: Text(
                          'Sun View Beach Hotel, Pohaddaramulla,       Wadduwa',
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.6,
                          ),
                        ),
                        leading: Icon(Icons.home,color: Color(0xffff9000),size :35.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton.icon(
                          onPressed: () => launch("tel://0767841468"),
                          icon: Icon(Icons.call,color: Color(0xffff9000),size :35.0),
                          label: new Text(
                            "Call Us :  038-22-95368",
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8,
                            ),
                          ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton.icon(
                          onPressed: () => launch("mailto:sunview.beach@gmail.com"),
                        icon: Icon(Icons.email,color: Color(0xffff9000),size :35.0),
                        label: new Text(
                          "sunview.beach@gmail.com",
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                    ),

                  ],
                )),
        ],
      ),
    );
  }
}
