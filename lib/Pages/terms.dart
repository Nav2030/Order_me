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
        child: new Column(
      children: <Widget>[
        new ListTile(
          title: new Text('You agree to comply with all applicable domestic and international laws, statutes, ordinances, and regulations regarding your use of our Website. Order Online Express reserves the right to investigate complaints or reported violations of our Legal Terms and to take any action we deem appropriate, including but not limited to cancelling your Member account, blocking your IP address from our sites, reporting any suspected unlawful activity to law enforcement officials, regulators, or other third parties and disclosing any information necessary or appropriate to such persons or entities relating to your profile, email addresses, usage history, posted materials, IP addresses and traffic information, as allowed under our Privacy Policy.'),
        ),
        new ListTile(
          title: new Text('Our Website may contain our service marks or trademarks as well as those of our affiliates or other companies, in the form of words, graphics, and logos. Your use of our Website does not constitute any right or license for you to use such service marks/trademarks, without the prior written permission of the corresponding service mark/trademark owner. Our Website is also protected under international copyright laws. The copying, redistribution, use or publication by you of any portion of our Website is strictly prohibited. Your use of our Website does not grant you ownership rights of any kind in our Website.'),
        )
      ],
    ),
      ),
    );
  }
}
