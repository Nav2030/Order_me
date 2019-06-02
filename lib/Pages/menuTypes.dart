import 'package:flutter/material.dart';
import 'package:system_for_hotel_mobile_app/Pages/menu_list.dart';

class Types extends StatefulWidget {
  @override
  _TypesState createState() => _TypesState();
}

class _TypesState extends State<Types> {
  _onTileClicked(int index){
    if(index == 0){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff9000).withOpacity(0.8),
        title: Text('Menu',
          textAlign: TextAlign.center,),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ],
        leading: new Container(),
      ),
      body: Container(
        child:new  GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) {
          return Card(
              child: new Stack(
                children: <Widget>[
                  InkWell(
                    onTap: ()=> _onTileClicked(index),
                    child: Image.asset("assets/carousel/menu$index.jpg",height:125.0,fit: BoxFit.cover,),
                  ),
                  new Positioned(
                    left: 0.0,
                    bottom: 20.0,
                    child: new Text('title',
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        )),
                  ),

                ],
              )
          ); //robohash.org api provide you different images for any number you are giving
        }),
      ),
      ),
    );
  }
}
