import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medicare/screens/homepage.dart';
import 'package:medicare/screens/register.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    TextEditingController username = TextEditingController();
    TextEditingController pass = TextEditingController();

    Future login() async
    {
      var url = "http://192.168.0.100/medicare_api/login.php";
      var response = await http.post(Uri.parse(url),body: {
        "username" : username.text,
        "password" : pass.text,
      });
      var data = json.decode(response.body);
      if(data == "Success")
      {
        Fluttertoast.showToast(
            msg: "LogIn Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        username.text = "";
        pass.text = "";
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
      }
      else
      {
        Fluttertoast.showToast(
            msg: "User and Password Incorrect",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
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
              SizedBox(height: 40,),
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
                child: Center(child: Text("LogIn",style: GoogleFonts.lato(fontSize: 40,
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
                        borderSide: BorderSide(color: Colors.indigoAccent,width: 3.0)
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
                  obscureText: true,
                  controller: pass,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(34.0),
                        borderSide: BorderSide(color: Colors.indigo,width: 3.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(34.0),
                        borderSide: BorderSide(color: Colors.indigoAccent,width: 3.0)
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
                  SizedBox(height: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                    },
                    child: Text("Register",style: GoogleFonts.lato(fontSize: 26,),)
                  ),
                  SizedBox(width: 30,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                    onPressed: (){
                      login();
                    },
                    child: Text("LogIn",style: GoogleFonts.lato(fontSize: 26,),),
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
