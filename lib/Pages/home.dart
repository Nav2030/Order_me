import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:system_for_hotel_mobile_app/Pages/terms.dart';

class Home extends StatefulWidget {
  const Home({
    Key key,
    @required this.user
  }):super(key: key);
  final FirebaseUser user;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0e0923),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search,color: Colors.white), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white), onPressed: (){}),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: Text('${widget.user.displayName}') ,
                accountEmail: Text('${widget.user.email}'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person,color: Color(0xffff9000)),
                ),
              ),
              decoration: new BoxDecoration(
                color: Color(0xff0e0923),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
              },
              child: ListTile(
                title: Text('Home Page',
                  style: TextStyle(color:  Color(0xff0e0960)),),
                leading: Icon(Icons.home,color:  Color(0xff0e0923),),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Orders',
                style: TextStyle(color:  Color(0xff0e0960)),),
                leading: Icon(Icons.shopping_basket,color:  Color(0xff0e0923),),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Order Status',
                  style: TextStyle(color:  Color(0xff0e0960)),
                ),
                leading: Icon(Icons.shopping_cart,color:  Color(0xff0e0923),),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Categories',
                  style: TextStyle(color:  Color(0xff0e0960)),),
                leading: Icon(Icons.dashboard,color:  Color(0xff0e0923),),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favourites',
                  style: TextStyle(color:  Color(0xff0e0960)),),
                leading: Icon(Icons.favorite,color:  Color(0xff0e0923),),
              ),
            ),

            Divider(),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Settings',
                  style: TextStyle(color:  Color(0xff0e0960)),),
                leading: Icon(Icons.settings,color: Colors.grey,),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Terms()));

              },
              child: ListTile(
                title: Text('Terms And Conditions',
                  style: TextStyle(color:  Color(0xff0e0960)),),
                leading: Icon(Icons.security,color:  Color(0xff0e0960),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
