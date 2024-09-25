import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


//**** Single Employee Data****
class MyApiBinding extends StatefulWidget{

  const MyApiBinding({super.key});
  @override
  State createState() => _MyApiBinding();
}

class _MyApiBinding extends State{
  Map<String, dynamic> emp={};
  @override
  Widget build(BuildContext context){
    return Scaffold( 
      appBar: AppBar( 
        title: const Text("ApiBinding"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: emp.isEmpty ?  const  Center(child:Text("Data is Empty")) :Row(
            children: [ 
               Text(emp['data']['employee_name']),
               const SizedBox( width: 60,),
               Text("${emp['data']['employee_salary']}")
            ],
           ),
      floatingActionButton: FloatingActionButton(
        onPressed: getEmployeeData,
        child: const Icon(Icons.add),
      ),
    );
  }
  void getEmployeeData()async{
    Uri url=Uri.parse("https://dummy.restapiexample.com/api/v1/employee/6");
    http.Response resourse= await http.get(url);
    //data is map<String, dynamic>
    var resourseData=json.decode(resourse.body);
    emp=resourseData;
    log("$emp");
    //get data from url id=6
    setState(() {
      
    });
  }
}
