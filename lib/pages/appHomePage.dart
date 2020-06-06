  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:haweyati/pages/dumpster/dumpstersList.dart';

  class AppHomePage extends StatefulWidget {
    @override
    _AppHomePageState createState() => _AppHomePageState();
  }

  class _AppHomePageState extends State<AppHomePage> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(backgroundColor: Color(0xfff2f2f2),
        appBar: AppBar(
          elevation: 0,
          iconTheme: new IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: Color(0xff313f53),
          title: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Image.asset(
              "assets/images/haweyati_logo1.png",
              width: 40,
              height: 40,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(icon:Icon( Icons.headset_mic),onPressed: (){},),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(icon: Icon(Icons.notifications),onPressed: (){},),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 4.4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
                color: Color(0xff313f53),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Hello", style: TextStyle(fontSize: 17, color: Colors.white,fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Explore our Product And Services",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      //height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Theme.of(context).accentColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("8233 An Najah Khalidiyah District, Jeddah")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: ListView(padding: EdgeInsets.all(20),
              children: <Widget>[

                _buildContainer("Construction DumpStar",Colors.red,(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DumpsterList()));}   ),
                _buildContainer("Scaffolding", Colors.grey,(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DumpsterList()));} )
  ,              _buildContainer("Building Material",Colors.greenAccent,(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DumpsterList()));} ),
                _buildContainer("Finshing Material", Colors.indigo,(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DumpsterList()));} )   ,
                _buildContainer("Delivery Vehicales",Colors.brown,(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DumpsterList()));} ),],
            ))
          ],
        ),

        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: Color(0xffff974d),
          onPressed: () {},
          child: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ),
      );
    }

    Widget _buildContainer(String title,Color color
        ,Function onTap,){

      return GestureDetector(onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(bottom: 20),
          height: 120,
            decoration: new BoxDecoration(color: color,
  //            image: new DecorationImage(
  //              image: new AssetImage(imgPath),
  //              fit: BoxFit.fill,
  //            ),
                borderRadius: BorderRadius.circular(15)
            ),child:Center(child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),) ,

        ),
      );
    }
  }
