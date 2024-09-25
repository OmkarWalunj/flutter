import 'package:expense_manager/view/Login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 300,
            ),
            GestureDetector(
              child: Container(
                width: 144,
                height: 144,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(234, 238, 235, 1),
                  shape: BoxShape.circle
                ),
                child: Image.asset("assets/images/8.jpg"),
              ),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (BuildContext context) => 
                      const LoginScreen()
                  )
                );        
              },
            ),

            const Spacer(),

            Text("Expense Manager",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16
              ),
            ),

            const SizedBox(
              height: 70,
            )
          ],
        ) 
        ),
    );
  }
}
