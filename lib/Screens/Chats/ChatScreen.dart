import 'package:flutter/material.dart';
import 'package:whatsapp_ui/Widgets/Uihelper.dart';

class ChatScreen extends StatelessWidget {
  var arrContent = [
    {
      "images":"https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
      "name":"Arun",
      "lastmsg":"hi",
      "time":"05:45 am",
      "msg":"1"
    },
    {
      "images":"https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg",
      "name":"Smriti",
      "lastmsg":"yes",
      "time":"06:15 am",
      "msg":"3"
    },
    {
      "images":"https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg",
      "name":"Shiro",
      "lastmsg":"bye",
      "time":"07:45 am",
      "msg":"9"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(itemBuilder: (context,index){
              return ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(arrContent[index]["images"].toString()),
                ),
                title: Uihelper.CustomText(text: arrContent[index]["name"].toString(), height: 14,fontweight: FontWeight.bold),
                subtitle: Uihelper.CustomText(text: arrContent[index]["lastmsg"].toString(), height: 13,color: Color(0XFF889095)),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Uihelper.CustomText(text: arrContent[index]["time"].toString(), height: 12,color: Color(0XFF026500)),
                    CircleAvatar(
                      backgroundColor: Color(0XFF036A01),
                      radius: 12,
                      child: Uihelper.CustomText(text: arrContent[index]["msg"].toString(), height: 12,color: Colors.white),
                    )
                  ],
                ),
              );
            },itemCount: arrContent.length,),
          ),
        ],
      ),
      floatingActionButton: CircleAvatar(
        radius: 30,
        backgroundColor: Color(0XFF008665),
        child:  Image.asset("assets/images/comment.png"),
      ),
    );
  }
}
