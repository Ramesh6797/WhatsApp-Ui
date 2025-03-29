import 'package:flutter/material.dart';
import 'package:whatsapp_ui/Screens/Login/Loginscreen.dart';
import 'package:whatsapp_ui/Widgets/Uihelper.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/image 1.png"),
            SizedBox(height: 20,),
            Uihelper.CustomText(text: "Welcome to WhatsApp", height: 20,color: Color(0XFF000000)),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Uihelper.CustomText(text: "Read out", height: 14,color: Color(0XFF5E5E5E)),
              Uihelper.CustomText(text: "Privacy Policy.", height: 14,color: Color(0XFF0C42CC)),
              Uihelper.CustomText(text: " Tap “Agree and continue”", height: 14,color: Color(0XFF5E5E5E)),
            ],),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Uihelper.CustomText(text: "to accept the", height: 14,color: Color(0XFF5E5E5E)),
              Uihelper.CustomText(text: "Teams of Service.", height: 14,color: Color(0XFF0C42CC)),
            ],),
          ],
        ),
      ),
      floatingActionButton: Uihelper.CustomButton(callback: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        }, buttonname: "Agree and continue"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}