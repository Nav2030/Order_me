import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:system_for_hotel_mobile_app/Pages/contact.dart';
import 'package:system_for_hotel_mobile_app/Pages/mainMenu.dart';
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
      height: 200.0,
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
          AssetImage('assets/carousel/menu0.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.easeOutSine,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 6.0,
        dotColor: Colors.transparent,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xffff9000).withOpacity(0.8),
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
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Mainmenu()));
              },
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
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Contact()));
              },
              child: ListTile(
                title: Text('Contact',
                  style: TextStyle(color:  Color(0xff0e0960)),),
                leading: Icon(Icons.call,color:  Color(0xff0e0923),),
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
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height : double.infinity,
          ),
          Container(
            color: Color(0xff0e0923).withOpacity(0.68),
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(top :10.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Welcome',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                          color: Colors.white.withOpacity(0.7),fontFamily: 'Raleway',
                          fontSize: 35.0,fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w800, letterSpacing: 0.8,
                          ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Sun View Beach Hotel',
                          textAlign: TextAlign.center,
                          style: new TextStyle(fontStyle: FontStyle.italic,color: Colors.orange,fontFamily: 'Raleway', fontSize: 35.0, fontWeight: FontWeight.w700, letterSpacing: 0.6,),
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Order your Favourites',
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontStyle: FontStyle.italic,color: Colors.white.withOpacity(0.7),fontFamily: 'RobotoMono', fontSize: 25.0, fontWeight: FontWeight.w700, letterSpacing: 0.6,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child:imageCarousel,
                    ),
                    InkWell(
                        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Mainmenu())),
                        child: Text('See your menu  >>',textAlign: TextAlign.center,
                          style: new TextStyle(fontStyle: FontStyle.italic,color: Colors.white.withOpacity(0.6),fontFamily: 'Raleway', fontSize: 20.0, fontWeight: FontWeight.w400, ),
                        ) ,
                    ),
                  ],
              )),
            ),
          ],
        ),
    );
  }
}



