import 'dart:convert';
import 'dart:developer';

import 'package:apibinding1/Model2.dart';
import 'package:apibinding1/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//single EmployeeData
class MyApiBinding1 extends StatefulWidget{

  const MyApiBinding1({super.key});
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
      body:emp.isEmpty ?  const  Center(child:Text("Data is Empty")) :Row(
            children: [ 
               Text(emp['employee_name']),
               const SizedBox( width: 60,),
               Text("${emp['employee_salary']}")
            ],
           ),
      floatingActionButton: FloatingActionButton(
        onPressed: getEmployeeData,
        child: const Icon(Icons.add),
      ),
    );
  }
  void getEmployeeData()async{
    Uri url=Uri.parse("https://dummy.restapiexample.com/api/v1/employee/1");
    http.Response resourse= await http.get(url);
    var resourseData=json.decode(resourse.body);
    EmployeeDetails1 dataInfo=EmployeeDetails1(resourseData);

    setState(() {
      emp=dataInfo.data!;
      log("$emp");
    });
  }
}


//All List
// class MyApiBinding1 extends StatefulWidget{

//   const MyApiBinding1({super.key});
//   @override
//   State createState() => _MyApiBinding();
// }

// class _MyApiBinding extends State{
//   List<Data> emp=[];
//   @override
//   Widget build(BuildContext context){
//     return Scaffold( 
//       appBar: AppBar( 
//         title: const Text("ApiBinding"),
//         centerTitle: true,
//         backgroundColor: Colors.blue,
//       ),
//       body: ListView.builder(
//         itemCount: emp.length,
//         itemBuilder: (context,index){ 
//           return Row(
//             children: [ 
//               Text(emp[index].empName!),
//               const SizedBox( width: 60,),
//               Text("${emp[index].empsal}")
//             ],
//            );
//       }),
//       floatingActionButton: FloatingActionButton(
//         onPressed: getEmployeeData,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
//   void getEmployeeData()async{
//     Uri url=Uri.parse("https://dummy.restapiexample.com/api/v1/employees");
//     http.Response resourse= await http.get(url);
//     var resourseData=json.decode(resourse.body);
//     EmployeeDetails dataInfo=EmployeeDetails(resourseData);

//     setState(() {
//       emp=dataInfo.data!;
//       log("$emp");
//     });
//   }
// }