import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/widgits/appBar.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:HaweyatiAppBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Stack(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Stack(
                      children: <Widget>[
                    Column(
                        children: <Widget>[
                       Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white,width: 3),
                          shape: BoxShape.circle
                       ),
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: AssetImage("assets/images/dumpsterhome.png"),
                              ),
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
//                        Positioned(
//                          bottom: 8,
//                          right: 0,
//                            child: MaterialButton(
//                              minWidth: 30,
//                              shape: CircleBorder(),
//                                color: Colors.white,
//                                padding: EdgeInsets.all(0),
//                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                              child: Icon(Icons.camera_alt,color: Colors.black,size: 16,),onPressed: (){},))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                Text("Arslan Khan",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 16)),
                SizedBox(height: 10,),
                Divider(thickness:1.5,),
                _profileTile(title: '+113456 786 634',icon: Icons.call,color: Colors.green),
                _profileTile(title: 'abc@abc.com',icon: Icons.email,color: Colors.purple),
                _profileTile(title: 'Manchester',icon: Icons.pin_drop,color: Colors.redAccent),
//                _profileTile(title: 'Bachelors In Computer Science',icon: CupertinoIcons.mail_solid,color: Colors.orange),
//                _profileTile(title: 'Not Working Yet',icon: Icons.work,color: Colors.black54),
                Divider(thickness:1.5,),
                SizedBox(height: 10),
//                Padding(
//                  padding: const EdgeInsets.symmetric(horizontal:20.0),
//                  child: Column(
//                    children: <Widget>[
//                      Align(
//                          alignment: Alignment.topLeft,
//                          child: Text("About Yourself",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18))),
//                      SizedBox(height: 10),
//                      Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"),
//                      SizedBox(height: 10),
//                    ],
//                  ),
//                ),

                Divider(thickness:1.5,),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget _profileTile({IconData icon,String title,Color color}){
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Icon(icon,color: Colors.white,),
      ),
      title: Text(title,style: TextStyle(fontSize: 15),),
    );
  }
}
