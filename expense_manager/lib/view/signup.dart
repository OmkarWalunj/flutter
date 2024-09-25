

import 'package:expense_manager/view/Login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget{

  const SignupScreen({super.key});
  @override
  State createState () => SignupScreenState();
}

class SignupScreenState extends State{
  TextEditingController uname=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController email=TextEditingController();

  @override
  Widget build(BuildContext context){

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
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
                    borderRadius: const BorderRadius.all(Radius.circular(200)),
                    border: Border.all(color: Colors.black)),
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
                Text("Create your Account",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

               

                 Container(
                  padding:const EdgeInsets.only(left: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.15),
                        blurRadius: 10,
                        offset: Offset(0, 3)
                      )
                    ]
                  ),
                  child: TextField(
                    controller: uname,
                    decoration:const  InputDecoration(
                      hintText: "Username",
                      border: InputBorder.none
                    )
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                Container(
                  padding:const EdgeInsets.only(left: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.15),
                        blurRadius: 10,
                        offset: Offset(0, 3)
                      )
                    ]
                  ),
                  child:  TextField(
                    obscureText: true,
                obscuringCharacter: "*",
                    controller: password,
                    decoration:const InputDecoration(
                      hintText: "Password",
                      border: InputBorder.none
                    )
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                Container(
                  padding:const EdgeInsets.only(left: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.15),
                        blurRadius: 10,
                        offset: Offset(0, 3)
                      )
                    ]
                  ),
                  child: TextField(
                    controller: email,
                    decoration:const  InputDecoration(
                      hintText: "Email",
                      border: InputBorder.none
                    )
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                GestureDetector(
                  onTap: createUser,
                  child: Container(
                    width: 300,
                    height: 49,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(14, 161, 125, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          blurRadius: 10,
                          offset: Offset(0, 3)
                        )
                      ]
                    ),
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 15
                        ),
                      ),
                    ),                   
                  ),

                  
                )
              ],
            ),

            const Spacer(),
            Row(
              children: [

                const SizedBox(
                  width: 50,
                ),

                Text("Already have an account?",
                  style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12
                        ),
                ),

                GestureDetector(
                  child: Text(" Sign In",
                    style: GoogleFonts.poppins(
                      color: const Color.fromRGBO(14, 161, 125, 1),
                            fontWeight: FontWeight.w400,
                            fontSize: 12
                          ),
                  ),

                  onTap: (){
                    Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (BuildContext context) => 
                      const LoginScreen()
                  )
                );
                  },
                )
                
              ],
            )
          ]
        ),
      ),
    );
  }

  void createUser() async {
    
  }
}