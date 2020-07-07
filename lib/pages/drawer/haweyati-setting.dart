import 'package:flutter/material.dart';
import 'package:haweyati/pages/drawer/setting/change-password.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:app_settings/app_settings.dart';
import 'setting/profile_page.dart';


class HaweyatiSetting extends StatefulWidget {
  @override
  _HaweyatiSettingState createState() => _HaweyatiSettingState();
}

class _HaweyatiSettingState extends State<HaweyatiSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(context: context,showCart: false,showHome: false,),
      body: ListView(
        children: <Widget>[

          Text(
            "Settings",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            " Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy tex ",
            textAlign: TextAlign.center,
          ),

SizedBox(height: 25,),
          _buildContainer(title: "Profile",onTap: (){
            CustomNavigator.navigateTo(context, ProfilePage());
          },)
          ,
          _buildContainer(title: "Notification",onTap:

              () {
            AppSettings.openAppSettings()
                .whenComplete(() {
              Navigator.of(context).pop();
            });
          },
          ),
          _buildContainer(title: "Change Password",onTap: (){CustomNavigator.navigateTo(context,ChangePassword());}),
        ],
        padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
      ),
    );
  }

  Widget _buildContainer({Function onTap,String title}){

    return GestureDetector(onTap:onTap,
      child: Container(margin: EdgeInsets.symmetric(vertical: 12), decoration: BoxDecoration(color:Color(0xfff2f2f2f2),borderRadius: BorderRadius.circular(15)), child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(children: <Widget>[Text(title),Icon(Icons.arrow_forward_ios,size: 15,)],mainAxisAlignment: MainAxisAlignment.spaceBetween,),
      ),),
    );


  }
}
