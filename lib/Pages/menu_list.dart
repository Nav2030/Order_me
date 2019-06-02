import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future getPosts() async{
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("foods").where('itemType',isEqualTo: 'Food').getDocuments();
    return qn.documents;
  }
  navigateToDetail(DocumentSnapshot menu){
    Navigator.push(context, MaterialPageRoute(builder: (context) => MenuDetails(menu:menu,)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
        backgroundColor: Color(0xffff9000).withOpacity(0.8),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white), onPressed: (){}),
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
                                    style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w900,color: Color(0xff0e0923)),),

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
class MenuDetails extends StatefulWidget {

  final DocumentSnapshot menu;

  MenuDetails({this.menu});

  @override
  _MenuDetailsState createState() => _MenuDetailsState();
}

class _MenuDetailsState extends State<MenuDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.menu.data['itemName'] ),
        backgroundColor: Color(0xffff9000).withOpacity(0.8),
      ),
      body:Column(
        children: <Widget>[
          Container(
            height: 250.0,
            width: 400.0,
            child: Card(
              child:Image.network(widget.menu.data['photoURL'],fit: BoxFit.cover,),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
            ),
          ),
          ListTile(
            title:Text(widget.menu.data['itemName'],
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold,color: Color(0xff0e0923)),
            ) ,
          ),
          ListTile(
            title:Text(widget.menu.data['description'],
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Color(0xff0e0923)),
            ),
            subtitle:Text(widget.menu.data['price'],
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,),
            ) ,
          ),
          new SizedBox(
            width: 200.0,
            height: 50.0,
            child: new RaisedButton(
                child: Text("Add To Cart", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.white),),
                color: Colors.orange,
                onPressed: () {}
            ),
          )
        ],

      ),
    );
  }
}
