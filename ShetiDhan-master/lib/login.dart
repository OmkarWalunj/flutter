import 'package:demo_test1/provider/auth_provider.dart';
import 'package:demo_test1/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});



  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
        title: "FlutterPhoneAuth",
      ),
    );
  }
}