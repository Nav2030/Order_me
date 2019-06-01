import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future getPosts() async{
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("foods").getDocuments();
    return qn.documents;
  }
  navigateToDetail(DocumentSnapshot menu){
    Navigator.push(context, MaterialPageRoute(builder: (context) => MenuDetails(menu:menu,)));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
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
                        child: new InkWell(
                          onTap: ()=> navigateToDetail(snapshot.data[index]),
                          child: Image.network(
                            snapshot.data[index].data['photoURL'],
                            fit: BoxFit.cover,),
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
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold,),
            ) ,
          ),
          ListTile(
            title:Text(widget.menu.data['description'],
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,),
            ),
            subtitle:Text(widget.menu.data['price'],
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,),
            ) ,
          ),
        ],

      ),
    );
  }
}
