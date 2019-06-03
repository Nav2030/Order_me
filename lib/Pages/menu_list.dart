import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future getPosts() async{
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("foods").where('itemType',isEqualTo: 'Meals').getDocuments();
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
  int _itemCount = 0;
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
            child: Card(
              child : new Stack(
                children: <Widget>[
                  Image.network(widget.menu.data['photoURL'],width:350.0,fit: BoxFit.cover,),
                  new Positioned(
                    right: 0.0,
                    bottom: 0.0,
                    child:  new Container(
                      height: 75.0,
                      width: 75.0,
                      child: FloatingActionButton(
                        backgroundColor:Color(0xffff9000) ,
                        onPressed: (){},
                        child: new Icon(Icons.add_shopping_cart, color:Colors.white ,size: 40.0,),
                      ),
                    ),
                  ),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
            ),

          ),
          Divider(),
          ListTile(
            title:Text(widget.menu.data['itemName'],
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold,color: Color(0xff0e0923)),
            ) ,
          ),
          Divider(),
          ListTile(
            title:Text(widget.menu.data['description'],
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Color(0xff0e0923)),
            ),
            subtitle:Text(widget.menu.data['price'],
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,),
            ) ,
          ),
          Divider(),
          ListTile(
            title: new Row(
                  children: <Widget>[
                    new Container(
                      child: Text('Quantity : ',
                          style: new TextStyle(fontSize: 22.0,color: Color(0xff0e0923),fontWeight: FontWeight.bold)),
                    ),
                    new Container(
                      width: 60.0,
                      height: 50.0,
                      child: FlatButton(
                        color : Color(0xffff9000),
                        onPressed: ()=>setState(()=>_itemCount++),
                        child: new Icon(Icons.add, color: Colors.white,),
                      ),
                    ),

                    new Container(
                      width: 60.0,
                      height: 50.0,
                      child: FlatButton(
                        color:Colors.white,
                        child: Text('$_itemCount',
                            style: new TextStyle(fontSize: 22.0)),
                      ),
                    ),
                    new Container(
                        width: 60.0,
                        height: 50.0,
                        child: FlatButton(
                          color:Color(0xffff9000) ,
                          onPressed: ()=>setState(()=>_itemCount--),
                          child: new Icon(
                            const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                            color: Colors.white),
                      ),
                    ),

                  ],
              ),
          ),
        ],

      ),
    );
  }
}
