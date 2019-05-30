import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:system_for_hotel_mobile_app/Pages/terms.dart';
import 'package:carousel_pro/carousel_pro.dart';

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
    Widget imageCarousel =  new Container(
      height: 250.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/carousel/menu1.jpg'),
          AssetImage('assets/carousel/menu2.jpg'),
          AssetImage('assets/carousel/menu3.jpg'),
          AssetImage('assets/carousel/menu4.jpg'),
          AssetImage('assets/carousel/menu5.jpg'),
          AssetImage('assets/carousel/menu6.jpg'),
          AssetImage('assets/carousel/menu7.jpg'),
          AssetImage('assets/carousel/menu8.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 6.0,
        dotColor: Colors.transparent,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff9000).withOpacity(0.8),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search,color: Colors.white), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white), onPressed: (){}),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: Text('Hello Customer') ,
                accountEmail: Text('${widget.user.email}'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person,color: Color(0xff0e0923)),
                ),
              ),
              decoration: new BoxDecoration(
                color: Color(0xffff9000).withOpacity(0.8),
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
      body: ListView(
        children: <Widget>[
          imageCarousel,
       ],
      ),
    );
  }
}
