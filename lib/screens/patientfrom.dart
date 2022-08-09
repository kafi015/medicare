import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class PatientFrom extends StatelessWidget {
  const PatientFrom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController id = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController age = TextEditingController();
    TextEditingController gender = TextEditingController();
    TextEditingController address = TextEditingController();
    TextEditingController dob = TextEditingController();
    TextEditingController mobile = TextEditingController();

    Future<void> insert_record() async
   {
     if(!(id.text=="") || !(name.text == "") || !(age.text == "") || !(gender.text == "") || !(address.text == "") || !(dob.text == "") || !(mobile.text == "") )
       {
         try{

           String uri = "http://192.168.0.100/medicare_api/insert_record_patient.php";
           var res =await http.post(Uri.parse(uri),body: {
             "id":id.text,
             "name":name.text,
             "age":age.text,
             "gender":gender.text,
             "address":address.text,
             "dob":dob.text,
             "mobile":mobile.text
           });

           var response = jsonDecode(res.body);

           if(response["success"] == "true" )
             {
               print("Record Inserted!");
             }
           else
             {
               print("Some issue");
             }

         }catch(e)
     {
       print(e);
     }
       }
     else
       {
         print("Please Filled All From");
       }
   }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Patient From"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Padding(
              padding:  EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                controller: id,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(34.0),
                    borderSide: BorderSide(color: Colors.red,width: 3.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(34.0),
                    borderSide: BorderSide(color: Colors.red,width: 3.0)
                  ),
                  labelText: "ID",
                  hintText: "Enter patient id",
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding:  EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                controller: name,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(34.0),
                      borderSide: BorderSide(color: Colors.red,width: 3.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(34.0),
                      borderSide: BorderSide(color: Colors.red,width: 3.0)
                  ),
                  labelText: "Name",
                  hintText: "Enter patient name",
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding:  EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                controller: age,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(34.0),
                      borderSide: BorderSide(color: Colors.red,width: 3.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(34.0),
                      borderSide: BorderSide(color: Colors.red,width: 3.0)
                  ),
                  labelText: "Age",
                  hintText: "Enter patient age",
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding:  EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                controller: gender,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(34.0),
                      borderSide: BorderSide(color: Colors.red,width: 3.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(34.0),
                      borderSide: BorderSide(color: Colors.red,width: 3.0)
                  ),
                  labelText: "Gender",
                  hintText: "Enter patient gender",
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding:  EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                controller: address,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(34.0),
                      borderSide: BorderSide(color: Colors.red,width: 3.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(34.0),
                      borderSide: BorderSide(color: Colors.red,width: 3.0)
                  ),
                  labelText: "Address",
                  hintText: "Enter patient address",
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding:  EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                controller: dob,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(34.0),
                      borderSide: BorderSide(color: Colors.red,width: 3.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(34.0),
                      borderSide: BorderSide(color: Colors.red,width: 3.0)
                  ),
                  labelText: "Date of Birth",
                  hintText: "Enter patietn Date of Birth",
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding:  EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                controller: mobile,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(34.0),
                      borderSide: BorderSide(color: Colors.red,width: 3.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(34.0),
                      borderSide: BorderSide(color: Colors.red,width: 3.0)
                  ),
                  labelText: "Mobile",
                  hintText: "Enter patient mobile number",
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: (){
                insert_record();
                },
                child: Text("Inset"),
            ),
          ],
        ),
      ),
    );
  }
}
