import 'package:crudfirey/services/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController agecontroller = new TextEditingController();
  TextEditingController locationcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text(
          "Employee", 
          style: TextStyle(
            color: Colors.blue, 
            fontSize: 20.0, 
            fontWeight: FontWeight.bold),
        ),
        Text(
          "Form", 
          style: TextStyle(
            color: Colors.orange, 
            fontSize: 24.0, 
            fontWeight: FontWeight.bold),
        ),
      ],),),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name", 
              style: TextStyle(
                color: Colors.black, 
                fontSize: 24.0, 
                fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(), 
                borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: namecontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),   
            ),
            Text(
              "Age", 
              style: TextStyle(
                color: Colors.black, 
                fontSize: 24.0, 
                fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(), 
                borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: agecontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),   
            ),
            Text(
              "Location", 
              style: TextStyle(
                color: Colors.black, 
                fontSize: 24.0, 
                fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(), 
                borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: locationcontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),   
            ),
            SizedBox(height: 30.0),
            Center(
              child: ElevatedButton(
                onPressed: () async{
                  String Id = randomAlphaNumeric(10);
                Map<String, dynamic> employeeInfoMap={
                  "Name": namecontroller.text,
                  "Age": agecontroller.text,
                  "Id":Id,
                  "Location": locationcontroller.text,
                };
            await DatabaseMethods().addEmployeeDetails(employeeInfoMap, Id).then((value){
              Fluttertoast.showToast( 
                  msg: "Employee Details added successfluyy",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            });   
              }, 
              child: Text(
                "Add", 
                style: TextStyle(
                  fontSize: 20.0, 
                  fontWeight: FontWeight.bold),),),
            ),

          ],),),
    );
  }
}