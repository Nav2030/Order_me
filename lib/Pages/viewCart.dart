import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewCart extends StatefulWidget {
  @override
  _ViewCartState createState() => _ViewCartState();
}

class _ViewCartState extends State<ViewCart> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      scrollDirection: Axis.vertical,
      children: <Widget>[
        OrderCard(),
      ],
    );
  }
}


class OrderCard extends StatefulWidget {
  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  String itemCode;
  Future getItems() async{
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("Shoppingcart").getDocuments();
    return qn.documents;
  }
  Future viewDetails(itemCode) async{
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("foods").where('itemCode',isEqualTo: itemCode).getDocuments();
    return qn.documents;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        child: Row(
          children: <Widget>[
            FutureBuilder(
                future: getItems(),
                builder: (_,snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Text("Loading.."),
                    );
                  }
                  else {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (_, index) {
                          return Container(
                            height: 200,
                            child: Card(
                              child: Stack(
                                children: <Widget>[
                                  new Positioned(
                                    left: 5.0,
                                    bottom: 0.0,
                                    child: new Text(snapshot.data[index].data['itemCode'],
                                      style: TextStyle(fontSize: 30.0,fontFamily: 'Raleway',fontWeight: FontWeight.w900,backgroundColor:Color(0xff0e0923).withOpacity(0.6),color: Colors.white.withOpacity(0.8)),),

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
                    );
                  }
                }
            )
          ],
        ),
      ),
    );
  }
}
