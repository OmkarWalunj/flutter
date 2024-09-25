import 'dart:io';
import 'package:demo_test1/login.dart';
import 'package:demo_test1/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ?
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyACHNmybndWgP85uX2QVpHBPNi23zBoQvQ",
      appId: "1:932017506304:android:e8de0a1fee87f58b4fb0e5",
      messagingSenderId: "932017506304",
      projectId: "shetidhan-84856",
      storageBucket: "gs://shetidhan-84856.appspot.com",
    ),
  ):
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShetiDhan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        'myapp':(context) => const MyApp1(),
        'home': (context) => const MyBottomNavBar(),

      },
    );
  }
}
