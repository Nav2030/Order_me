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
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: new Center(
        child: FlatButton(
            onPressed: () => launch("tel://0722001609"),
            child: new Text('Call Me')
        ),
      ),
    );
  }
}
