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
  List lst = ["Meals","Starters","Desserts","Appetizers","Beverages","Bar"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff9000).withOpacity(0.8),
        title: Text('Menu Categories',
          textAlign: TextAlign.center,),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(padding: const EdgeInsets.only(top: 5.0) ,
        child: Container(
          child:new  GridView.count(
            crossAxisCount: 2,
            children: List.generate(6, (index) {
              return Card(
                  child: new Stack(
                    children: <Widget>[
                      InkWell(
                        onTap: ()=> _onTileClicked(index),
                        child: Image.asset("assets/types/Type$index.jpg",height:135.0,fit: BoxFit.cover,),
                      ),
                      new Positioned(
                        left: 5.0,
                        bottom: 15.0,
                        child: new Text(lst[index],
                          style: TextStyle(fontFamily:'RobotoMono',fontSize: 20.0,fontWeight: FontWeight.bold),textAlign: TextAlign.center,
                        ),
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