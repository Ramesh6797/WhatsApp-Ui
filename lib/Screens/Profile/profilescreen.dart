import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_ui/Screens/Home/homescreen.dart';
import 'package:whatsapp_ui/Widgets/Uihelper.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController namecontroller = TextEditingController();

  File? pickedimage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Uihelper.CustomText(
              text: "Profile info",
              height: 25,
              color: Color(0XFF00A884),
              fontweight: FontWeight.bold,
            ),
            SizedBox(height: 40),
            Uihelper.CustomText(
              text: "Please provide your name and an optional",
              height: 17,
              color: Color(0XFF5E5E5E),
            ),
            Uihelper.CustomText(
              text: "profile photo",
              height: 17,
              color: Color(0XFF5E5E5E),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                _openBottom(context);
              },
              child: pickedimage==null? CircleAvatar(
                radius: 80,
                backgroundColor: Color(0XFFD9D9D9),
                child: Image.asset(
                  "assets/images/camera.png",
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ): CircleAvatar(
                radius: 80,
                backgroundImage: pickedimage != null ? FileImage(pickedimage!) : null,
              )
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextField(
                      keyboardType: TextInputType.name,
                      controller: namecontroller,
                      decoration: InputDecoration(
                        hintText: "Type your name here",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFF00A884)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFF00A884)),
                        ),
                      ),
                    ),
                  ),
                  Image.asset("assets/images/smile.png"),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Uihelper.CustomButton(
        callback: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
        },
        buttonname: "Next",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _openBottom(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: (){
                    _pickImage(ImageSource.camera);
                  }, icon: Icon(Icons.camera_alt,size: 80,color: Colors.grey,),
                  ),
                  IconButton(onPressed: (){
                    _pickImage(ImageSource.gallery);
                  }, icon: Icon(Icons.image,size: 80,color: Colors.grey,)
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  _pickImage(ImageSource imagesource)async{
    try{
      final photo = await ImagePicker().pickImage(source: imagesource);
      if(photo == null) return;
      final tempimage = File(photo.path);
      setState(() {
        pickedimage = tempimage;
      });
    }
    catch(ex) {
      return ScaffoldMessenger.maybeOf(context)?.showSnackBar(SnackBar(content: Text(ex.toString()),backgroundColor: Color(0XFF00A884),));
    }
  }
}
