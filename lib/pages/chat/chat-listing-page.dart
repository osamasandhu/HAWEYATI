import 'package:flutter/material.dart';
import 'package:haweyati/pages/chat/chat-page.dart';
import 'package:haweyati/widgits/appBar.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> with SingleTickerProviderStateMixin {

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2,vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HaweyatiAppBar(
          bottomWidget: TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.only(bottom: 10),
            labelPadding: EdgeInsets.only(bottom: 20),
            controller: tabController,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
            tabs: <Widget>[
              Text('Customer'),
              Text('Driver'),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            messagesPage(),
            messagesPage(),
          ],
        ));
  }

  Widget messagesPage(){
    return ListView(
        children: <Widget>[
          messages("A", "Ali", "Hi, How are you?"),
          messages( "Z", "Ali", "Doing Work?"),
          messages( "W", "Ali", "Doing Work?"),
          messages("U", "Ali", "Hi, How are you?"),
          messages( "O", "Ali", "Doing Work?"),
          messages( "K", "Ali", "Doing Work?"),
          messages("F", "Ali", "Hi, How are you?"),
          messages( "L", "Ali", "Doing Work?"),
          messages( "I", "Ali", "Hi, How are you?")
        ]);
  }

  Widget messages(String leading, String title, String subtitle) {

    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatViewPage()));
      },
      leading: CircleAvatar(
          child: Image.asset(
            'assets/images/scaffolding.png',
          )),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      trailing: Text("05:57am"),
    );
  }
}