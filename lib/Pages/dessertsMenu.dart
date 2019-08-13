import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:system_for_hotel_mobile_app/Pages/viewCart.dart';
import 'meuDetailsdart.dart';

class DessertsMenuListPage extends StatefulWidget {
  @override
  _DessertsMenuListPageState createState() => _DessertsMenuListPageState();
}

class _DessertsMenuListPageState extends State<DessertsMenuListPage> {
  Future getPosts() async{
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("foods").where('itemType',isEqualTo: 'Desserts').getDocuments();
    return qn.documents;
  }
  navigateToDetail(DocumentSnapshot menu){
    Navigator.push(context, MaterialPageRoute(builder: (context) => MenuDetails(menu:menu,)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desserts'),
        backgroundColor: Color(0xffff9000).withOpacity(0.8),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ViewCart())),),
        ],
      ),
      body:Container(
          child: FutureBuilder(
              future: getPosts(),
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
                                new InkWell(
                                  onTap: ()=> navigateToDetail(snapshot.data[index]),
                                  child: Image.network(
                                    snapshot.data[index].data['photoURL'],width: 350.0,
                                    fit: BoxFit.cover,),
                                ),
                                new Positioned(
                                  left: 5.0,
                                  bottom: 0.0,
                                  child: new Text(snapshot.data[index].data['itemName'],
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
      ),
    );

  }
}
