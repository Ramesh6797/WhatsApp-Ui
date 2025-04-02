import 'package:flutter/material.dart';
import 'package:whatsapp_ui/Screens/Calls/CallsScreen.dart';
import 'package:whatsapp_ui/Screens/Camera/CameraScreen.dart';
import 'package:whatsapp_ui/Screens/Chats/ChatScreen.dart';
import 'package:whatsapp_ui/Screens/Status/StatusScreen.dart';
import 'package:whatsapp_ui/Widgets/Uihelper.dart';

class HomeScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.camera_alt),),
            Tab(text: "CHATS",),
            Tab(text: "STATUS",),
            Tab(text: "CALLS",),
          ],
          indicatorColor: Colors.white,
          ),
          toolbarHeight: 100,
          title: Uihelper.CustomText(text: "WhatsApp", height: 25,color: Colors.white,fontweight: FontWeight.bold),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(onPressed: (){}, icon: Image.asset("assets/images/search.png")),
            )
          ],
        ),
        body: TabBarView(children: [
          CameraScreen(),
          ChatScreen(),
          StatusScreen(),
          CallsScreen(),
        ]),
      ),
    );
  }
}