import 'package:flutter/material.dart';

class Terms extends StatefulWidget {
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms And Conditions'),
      ),
      body:  SingleChildScrollView(
        child: new ListView(
          children: <Widget>[
            new ListTile(
              title: new Text('Menu is displayed as the availability of the menu items in the mapped restaurant.',
              new TextStyle()
              ),
            ),
            new ListTile(
              title: new Text('In case certain menu items are not listed in the menu page. In case of non availability of ordered product at the mapped restaurant, the order would not be executed. Same would be informed by the restaurant to you.'),
            ),
            new ListTile(
              title: new Text('The online order once placed cannot be modified or cancelled either through the website or offline by calling the restaurant.'),
            ),
            new ListTile(
              title: new Text('However you can get updated on the status of the order by calling the restaurant directly'),
            ),
            new ListTile(
              title: new Text('In case the order which is paid through credit card is cancelled due to non availability of the ordered product at the restaurant, the amount will be returned by reversing the transaction by our restaurant. The same would reflect in the next credit card statement.'),
            ),
            new ListTile(
              title: new Text('Order Me may collect personal information from you including your first and last name, address, telephone and mobile number(s), email address and any other information, when you knowingly provide us with this information.'),
            ),
            new ListTile(
              title: new Text('Order Me may use the personal information that you submit to store and process that information in order to provide goods and services. Generally, we may use your personal information in the ways in which you would expect, including but not limited.'),
            ),
            new ListTile(
              title: new Text('Order Me does not store any of your credit card details'),
            ),
      ],
    ),
      ),
    );
  }
}
