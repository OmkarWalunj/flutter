import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorite extends StatefulWidget{
  const Favorite({super.key});
  @override
  State createState() => _Favorite();
}

class _Favorite extends State {
  @override
 Widget build(BuildContext context){
  return Scaffold( 
    backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
    body: Stack(
      children: [
         Positioned(
          top: 0,
          left: 0,
          child: Container(
            height: 551,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/06.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0), // No blur initially
              child: Container(
                color: const Color.fromARGB(19, 19, 19, 1), // Keep transparent to let the blur apply
              ),
            ),
          ),
        ),
        Positioned(
          top: 551 - 100, // Starting point of the blur effect
          left: 0,
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color.fromARGB(19, 19, 19, 1), // No color at the start of the gradient
                  const Color.fromRGBO(19, 19, 19, 1).withOpacity(1), // Semi-transparent black at the end
                ],
              ),
            ),
          ),
        ),
          Positioned(
            top: 465,
            left: 94,      
            child: SizedBox(
              height: 87,
              width: 219,
              
              child: Center(
                child: Text(
                  "Alone in the Abyss",
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(230, 154, 21, 1),
                    
                  ),
                ),
              ),
            ),
          ),
           Positioned(
            top: 520,
            left: 170,      
            child: SizedBox(
              height: 16,
              width: 60,
              
              child: Center(
                child: Text(
                  "Youlakou",
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    
                  ),
                ),
              ),
            ),
          ),
           Positioned(
            top: 528,
            left: 348,      
            child: SizedBox(
              height: 25,
              width: 25,
              
              child: Image.asset("assets/icons/02.png")
            ),
          ),
          Positioned( 
    top: 562,
    left: 20,
    
    child:  SizedBox(
      height: 18,
      width:  MediaQuery.of(context).size.width ,
      child: Row (
        children: [
        SizedBox(
                    height: 18,
                    width: 130,
                    child: Text(
                      "Dynamic Warmup | ",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(203, 200, 200, 1),
                        //height: 1.2,
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 18,
                    width: 54,
                    child: Text(
                      "4 Min",
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        //height: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox( 
                    width: 20,
                  )
      
      ],),
    ),
  ),
  Positioned(
    top: 594,
    left: 15,
    child:  Container(
      height: 6,
      width: 370,
      
      decoration: const BoxDecoration( 
        gradient:LinearGradient(colors: [Color.fromRGBO(230, 154, 21, 1),Color.fromRGBO(217, 217, 217, 0.19)],stops: [0.3,0.3]) ,
        borderRadius: BorderRadius.all(Radius.circular(15),
        )
      ),
    )),
    Positioned(
      top: 622,
      child:  Row( 
        children: [ 
          const SizedBox( 
            width: 41,
          ),
          SizedBox( 
            width: 20,
            height: 20,
            child: Image.asset("assets/icons/03.png"),
          ),
           const SizedBox( 
            width: 41,
          ),
          SizedBox( 
            height:25 ,
            width: 25,
            child: Image.asset("assets/icons/back.jpg"),
          ),
          const SizedBox( 
            width: 41,
          ),
          SizedBox( 
            height:50 ,
            width: 50,
            child: Image.asset("assets/icons/04.png"),
          ),
           const SizedBox( 
            width: 41,
          ),
          SizedBox( 
            height:25 ,
            width: 25,
            child: Image.asset("assets/icons/next.jpg"),
          ),
           const SizedBox( 
            width: 41,
          ),
           SizedBox( 
            height:50 ,
            width: 50,
            child: Image.asset("assets/icons/05.png"),
          ),
        ],
      ))
        ],
    ),
  );
 }
}
