

import 'package:expense_manager/view/signup.dart';
import 'package:expense_manager/view/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController name=TextEditingController();
  TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
              width: 400,
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius:const BorderRadius.all(Radius.circular(200)),
                border: Border.all(color: Colors.black),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(200)),
                child: Image.asset(
                  "assets/images/8.jpg",
                  fit: BoxFit.cover,
                  width: 300,
                  height: 300,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login to your Account",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration:const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.15),
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: name,
                    decoration:const InputDecoration(
                      hintText: "Username",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  
                  decoration:const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.15),
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    obscureText: true,
                obscuringCharacter: "*",
                    controller:password,
                    decoration:const InputDecoration(
                      hintText: "Password",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  
                  onTap: (){
                  Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (BuildContext context) => 
                      const TransactionScreen()
                  )
                );
                  },
                  child: Container(
                    width: 300,
                    height: 49,
                    decoration:const BoxDecoration(
                      color: Color.fromRGBO(14, 161, 125, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const SizedBox(
                  width: 50,
                ),
                Text(
                  "Don’t have an account?",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    " Sign up",
                    style: GoogleFonts.poppins(
                      color: const Color.fromRGBO(14, 161, 125, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const SignupScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void loginUser() async {
    
  }
}
