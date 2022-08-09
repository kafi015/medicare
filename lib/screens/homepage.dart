import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicare/screens/login.dart';
import 'package:medicare/screens/patientfrom.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_return),
          onPressed: (){
            showalert(context);
          },
        ),
        backgroundColor: Colors.grey,
        title: Image.asset("assets/logo.png",scale:1,),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientFrom()));
            }, child: Text("Patient From")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInPage()));
            }, child: Text("Log Out")),
          ],
        ),
      ),

    );
  }
}


showalert(BuildContext context)
{
  Widget okButton = ElevatedButton(
    style: ElevatedButton.styleFrom(backgroundColor: Colors.indigoAccent),
      onPressed: (){
        Navigator.pop(context);
      },
      child: Text("No")
  );

  Widget noButton = ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.indigoAccent),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInPage()));

      },
      child: Text("OK")
  );

  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.red,
    title: Text("Alert"),
    content: Text("Do you want to LogOut?"),
    actions: [
      okButton,
      noButton,
    ],
  );

  showDialog(
      context: context,
      builder: (BuildContext context)=> alert
  );


}