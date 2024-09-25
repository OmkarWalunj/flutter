

import 'package:apibinding1/ApiBindingByModel.dart';
import 'package:apibinding1/ApiBuilding1.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     debugShowCheckedModeBanner: false,
      home:  MyApiBinding1(),
    );
  }
}


//***** All Employee data****
// class MyApiBinding extends StatefulWidget{

//   const MyApiBinding({super.key});
//   @override
//   State createState() => _MyApiBinding();
// }

// class _MyApiBinding extends State{
//   List<dynamic> emp=[];
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
//               Text(emp[index]['employee_name']),
//               const SizedBox( width: 60,),
//               Text("${emp[index]['employee_salary']}")
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
//     emp=resourseData["data"];
//     log("$emp");
//     setState(() {
      
//     });
//   }
// }
