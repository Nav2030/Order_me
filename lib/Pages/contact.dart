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
            padding: const EdgeInsets.only(top :180.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Contact Us',
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          color: Color(0xffff9000).withOpacity(0.8),
                          fontSize: 30.0,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                        child: new ListTile(
                              title: Text(
                                'Sun View Beach Hotel, Pohaddaramulla,       Wadduwa',
                                textAlign: TextAlign.left,
                                style: new TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.6,
                                ),
                              ),
                              leading: Icon(Icons.home,color: Color(0xffff9000).withOpacity(0.8),size :35.0),
                            ),

                    ),
                    Padding(padding: const EdgeInsets.all(12.0),
                      child: new InkWell(
                          onTap:  () => launch("tel://0383374374"),
                          child :ListTile(
                            title: Text(
                              '038-33-74374',
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.6,
                              ),
                            ),
                            leading: Icon(Icons.call,color: Color(0xffff9000).withOpacity(0.8),size :35.0),
                          )
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(12.0),
                      child: new InkWell(
                          onTap:  () => launch("mailto:sunview.beach@gmail.com"),
                          child :ListTile(
                            title: Text(
                              "sunview.beach@gmail.com",
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.6,
                              ),
                            ),
                            leading: Icon(Icons.mail,color: Color(0xffff9000).withOpacity(0.8),size :35.0),
                          )
                      ),
                    ),
                  ],
                )
          ),
        ],
      ),
    );
  }
}
