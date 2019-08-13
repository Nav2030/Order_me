import 'package:flutter/material.dart';
import 'package:system_for_hotel_mobile_app/Pages/barMenu.dart';
import 'menuTypes.dart';


class Mainmenu extends StatefulWidget {
  @override
  _MainmenuState createState() => _MainmenuState();
}

class _MainmenuState extends State<Mainmenu> {
  _onTileClicked(int index){
    switch(index){
      case 0 : Navigator.push(context, MaterialPageRoute(builder: (context) => Types())); break;
      case 1 : Navigator.push(context, MaterialPageRoute(builder: (context) => BarMenuListPage())); break;

    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Color(0xffff9000).withOpacity(0.8),
      ),
      body: Padding(padding: const EdgeInsets.only(top: 0.0) ,
        child: Container(
          child:new  GridView.count(
            crossAxisCount: 1,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 2),
            children: List.generate(2, (index) {
              return Card(
                  child: new Stack(
                    children: <Widget>[
                      InkWell(
                        onTap: ()=> _onTileClicked(index),
                        child: Image.asset("assets/menu/menu$index.jpg",height:310.0,width: 350.00,fit: BoxFit.cover),
                      ),
                    ],
                  )
              ); //robohash.org api provide you different images for any number you are giving
            }),
          ),
        ),
      ),
    );
  }
}