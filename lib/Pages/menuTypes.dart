import 'package:flutter/material.dart';
import 'package:system_for_hotel_mobile_app/Pages/appetizersMenu.dart';
import 'package:system_for_hotel_mobile_app/Pages/beveragesMenu.dart';
import 'package:system_for_hotel_mobile_app/Pages/dessertsMenu.dart';
import 'package:system_for_hotel_mobile_app/Pages/menu_list.dart';
import 'package:system_for_hotel_mobile_app/Pages/startersMenu.dart';
import 'package:system_for_hotel_mobile_app/Pages/viewCart.dart';

class Types extends StatefulWidget {
  @override
  _TypesState createState() => _TypesState();
}

class _TypesState extends State<Types> {
  _onTileClicked(int index){
    switch(index){
      case 0 : Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage())); break;
      case 1 : Navigator.push(context, MaterialPageRoute(builder: (context) => StartersMenuListPage())); break;
      case 2 : Navigator.push(context, MaterialPageRoute(builder: (context) => DessertsMenuListPage())); break;
      case 3 : Navigator.push(context, MaterialPageRoute(builder: (context) => AppetizersMenuListPage())); break;
      case 4 : Navigator.push(context, MaterialPageRoute(builder: (context) => BeveragesMenuListPage())); break;
    }

  }
  List lst = ["Meals","Starters","Desserts","Appetizers","Beverages"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff9000).withOpacity(0.8),
        title: Text('Food Menu',
          textAlign: TextAlign.center,),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ViewCart())),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (_, index) {
            return Container(
              height: 200,
              child: Card(
                child: Stack(
                  children: <Widget>[
                    new InkWell(
                      onTap: ()=> _onTileClicked(index),
                      child: Image.asset("assets/types/Type$index.jpg",width: 350.0,fit: BoxFit.cover,),
                    ),
                    new Positioned(
                      left: 10.0,
                      bottom: 10.0,
                      child: new Text(lst[index],
                        style: TextStyle(fontSize: 30.0,fontFamily: 'Raleway',fontWeight: FontWeight.bold,backgroundColor:Color(0xff0e0923).withOpacity(0.6),color: Colors.white.withOpacity(0.8)),),

                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
            );
          }
      ),
    );
  }
}
