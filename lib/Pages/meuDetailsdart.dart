import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sweetalert/sweetalert.dart';

class MenuDetails extends StatefulWidget {

  final DocumentSnapshot menu;

  MenuDetails({this.menu});

  @override
  _MenuDetailsState createState() => _MenuDetailsState();
}

class _MenuDetailsState extends State<MenuDetails> {
  int _itemCount = 0;

  @override

  Widget build(BuildContext context) {
    _add(){
      Firestore.instance.runTransaction((transaction) async {
        await transaction.set(Firestore.instance.collection("Shoppingcart").document(widget.menu.data['itemCode']), {
          'itemCode':widget.menu.data['itemCode'],
        });
      });
      SweetAlert.show(context,
          title: "Added To cart",
          style: SweetAlertStyle.success);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.menu.data['itemName'] ),
        backgroundColor: Color(0xffff9000).withOpacity(0.8),
      ),
      body:Column(
        children: <Widget>[
          Container(

            child: Card(
              child : new Stack(
                children: <Widget>[
                  Image.network(widget.menu.data['photoURL'],fit: BoxFit.cover,),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
            ),

          ),

          ListTile(
            title:Text(widget.menu.data['itemName'],
              style: TextStyle(fontSize: 22.0,fontFamily: 'Raleway', fontWeight: FontWeight.bold,color: Color(0xff0e0923).withOpacity(0.7)),
            ) ,
          ),
          Divider(),
          ListTile(
            title:Text(widget.menu.data['description'],
              style: TextStyle(fontSize: 20.0,fontFamily: 'Raleway', fontWeight: FontWeight.bold,color: Color(0xff0e0923).withOpacity(0.7)),
            ),
            subtitle:Text(widget.menu.data['price'],
              style: TextStyle(fontSize: 20.0, fontFamily: 'Raleway',fontWeight: FontWeight.bold,),
            ) ,
          ),
          Divider(),
        ],

      ),
      floatingActionButton: new Container(
        height: 75.0,
        width: 75.0,
        child: FloatingActionButton(
          backgroundColor:Color(0xffff9000),
          onPressed:  () => _add(),
          child: new Icon(Icons.add_shopping_cart, color:Colors.white.withOpacity(0.8),size: 40.0,),
        ),
      ),
    );
  }
}
