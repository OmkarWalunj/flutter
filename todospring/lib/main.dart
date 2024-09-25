import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todospring/controller/user_controller.dart';
import 'package:todospring/model/user.dart';
import 'package:todospring/view/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (BuildContext context){
      return UserController(modelobj: User());
    },
    child:MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TodoApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const LoginScreen()
    ) ,
    );
    
  }
}

