import 'package:flutter/material.dart';
import 'package:whatsapp_ui/Screens/OTP/otpscreen.dart';
import 'package:whatsapp_ui/Widgets/Uihelper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phonecontroller = TextEditingController();
  String selectedcountry = "India";

  List<String>countries=[
    "India",
    "America",
    "Africa",
    "Italy",
    "Germany",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30,),
          Center(
            child: Uihelper.CustomText(text: "Enter your phone number", height: 25,color: Color(0XFF00A884),fontweight: FontWeight.bold)
          ),
          SizedBox(height: 40,),
          Center(
            child: Uihelper.CustomText(text: "WhatsApp will need to verify your phone", height: 17,color: Color(0XFF5E5E5E),)
          ),
          Center(
            child: Uihelper.CustomText(text: "number. Carrier charges may apply.", height: 17,color: Color(0XFF5E5E5E),)
          ),
          Center(
            child: Uihelper.CustomText(text: " What’s my number?", height: 17,color: Color(0XFF00A884),)
          ),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(left: 60,right: 60),
            child: DropdownButtonFormField(items: countries.map((String country){
              return DropdownMenuItem(value: country,child: Text(country.toString()),);
            }).toList(), onChanged: (value){
              setState(() {
                selectedcountry=value!;
              });
            },value: selectedcountry,decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0XFF00A884),),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0XFF00A884),),
              ),
            ),
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 35,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "+91",
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF00A884))
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF00A884))
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF00A884),),
                    ), 
                  ),
                ),
              ),
              SizedBox(width: 10,),
              SizedBox(
                  width: 245,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: phonecontroller,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF00A884),),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF00A884),),
                      ),
                    ),
                  ),
              )
            ],
          )
        ],
      ),
      floatingActionButton: Uihelper.CustomButton(callback: (){
        login(phonecontroller.text.toString());
      }, buttonname: "Next"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
  login(String phonenumber) {
    if(phonenumber == "") {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter Phone Number"),backgroundColor: Color(0XFF00A884),));
    }
    else {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> OTPscreen(phonenumber: phonenumber,)));
    }
  }
}