import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/pages/drawer/setting/edit-profile.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:HaweyatiAppBar(showHome: false,showCart: false,),
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

              ],
            ),
          ),

        ],
      ),
      floatingActionButton:FloatingActionButton ( onPressed: (){CustomNavigator.navigateTo(context,EditProfile());},
        child: Icon(Icons.add,color: Colors.white,),) ,
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
