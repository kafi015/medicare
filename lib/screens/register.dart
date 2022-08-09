import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart'as http;
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    TextEditingController username = TextEditingController();
    TextEditingController pass = TextEditingController();

    Future register() async
    {
      var url = "http://192.168.0.100/medicare_api/register.php";
      var response = await http.post(Uri.parse(url),body: {
        "username" : username.text,
        "password" : pass.text,
      });
      var data = json.decode(response.body);
      if(data == "Error")
      {
        Fluttertoast.showToast(
            msg: "This is already exist",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
      else
      {
        Fluttertoast.showToast(
            msg: "Registration Succesfull",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }



    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100,),
              Container(
                height: height*0.1,
                width: width,
                child: Image.asset("assets/logo.png"),
              ),
              SizedBox(height: 40,),
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                height: height*0.08,
                width: width*0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(34.0),bottomRight: Radius.circular(34.0) ),
                  color: Colors.indigo,
                ),
                child: Center(child: Text("Register",style: GoogleFonts.lato(fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),)),
              ),
              SizedBox(height: 40,),
              Padding(
                padding:  EdgeInsets.only(left: 20,right: 20),
                child: TextField(
                  controller: username,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(34.0),
                        borderSide: BorderSide(color: Colors.indigo,width: 3.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(34.0),
                        borderSide: BorderSide(color: Colors.indigo,width: 3.0)
                    ),
                    labelText: "Username",
                    labelStyle: GoogleFonts.lato(color: Colors.black),
                    hintText: "Enter username",
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding:  EdgeInsets.only(left: 20,right: 20),
                child: TextField(
                  controller: pass,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(34.0),
                        borderSide: BorderSide(color: Colors.indigo,width: 3.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(34.0),
                        borderSide: BorderSide(color: Colors.indigo,width: 3.0)
                    ),
                    labelText: "Password",
                    labelStyle: GoogleFonts.lato(color: Colors.black),
                    hintText: "Enter password",
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Back",style: GoogleFonts.lato(fontSize: 26,)),
                  ),
                  SizedBox(width: 30,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                    onPressed: (){
                      register();
                    },
                    child: Text("Register",style: GoogleFonts.lato(fontSize: 26,),)
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
