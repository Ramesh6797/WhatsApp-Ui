import 'package:flutter/material.dart';
import 'package:whatsapp_ui/Screens/Login/Loginscreen.dart';
import 'package:whatsapp_ui/Widgets/Uihelper.dart';

class OTPscreen extends StatelessWidget {
  String phonenumber;
  OTPscreen({super.key, required this.phonenumber});
  TextEditingController otp1controller = TextEditingController();
  TextEditingController otp2controller = TextEditingController();
  TextEditingController otp3controller = TextEditingController();
  TextEditingController otp4controller = TextEditingController();
  TextEditingController otp5controller = TextEditingController();
  TextEditingController otp6controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Uihelper.CustomText(text: "Verifying your number", height: 25,color: Color(0XFF00A884),fontweight: FontWeight.bold),
            SizedBox(height: 40,),
            Uihelper.CustomText(text: "You’ve tried to register +91$phonenumber", height: 17,color: Color(0XFF5E5E5E)),
            Uihelper.CustomText(text: "recently. Wait before requesting an sms or a call.", height: 17,color: Color(0XFF5E5E5E)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Uihelper.CustomText(text: "with your code.", height: 17,color: Color(0XFF5E5E5E)),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  },
                  child: Uihelper.CustomText(text: "Wrong number?", height: 17,color: Color(0XFF00A884),),
                ),
                // TextButton(onPressed: (){
                //   Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                //   }, child: Uihelper.CustomText(text: "Wrong number?", height: 17,color: Color(0XFF00A884),)
                // ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Uihelper.CustomContainers(otp1controller),
                SizedBox(width: 14,),
                Uihelper.CustomContainers(otp2controller),
                SizedBox(width: 14,),
                Uihelper.CustomContainers(otp3controller),
                SizedBox(width: 14,),
                Uihelper.CustomContainers(otp4controller),
                SizedBox(width: 14,),
                Uihelper.CustomContainers(otp5controller),
                SizedBox(width: 14,),
                Uihelper.CustomContainers(otp6controller),
              ],
            ),
            SizedBox(height: 40,),
            Uihelper.CustomText(text: "Didn’t receive code?", height: 17,color: Color(0XFF00A884),)
          ],
        ),
      ),
      floatingActionButton: Uihelper.CustomButton(callback: (){}, buttonname: "Next"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}