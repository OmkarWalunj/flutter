import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/home1.dart';

class MyMusicApp extends StatefulWidget{
  const MyMusicApp({super.key});
  @override
  State createState() => _MyMusicApp();
}

class _MyMusicApp extends State {
  @override
 Widget build(BuildContext context){
  return Scaffold( 
    backgroundColor: Colors.black,
    body: Stack(
      children: [
        Positioned(
          top: -10,
          left: 0,
          child: Container(
              height: 648,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/img1.png"),
                 
                ),
              ),
            ),
        ),
          Positioned(
            top: 440, // Adjust this value based on your layout requirements
            left: 44,
            
            child: SizedBox(
              height: 132,
              width: 314,
              
              child: Text(
                "Dancing between The shadows      Of rhythm",
                maxLines: 3,
                style: GoogleFonts.inter(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  height: 1.2, 
                ),
              ),
            ),
          ),
          Positioned(
            top:600,
            left: 70,
            child:  GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute<void>(
      builder: (BuildContext context) => const MusicApp(),
    ),);
              },
              child: Container( 
                height: 47,
                width: 261,
                alignment: Alignment.center,
              decoration:const BoxDecoration( 
                color: Color.fromRGBO(255, 46, 0, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(19)
                  )
              ),
              child: Text("Get started",style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color:const Color.fromRGBO(19, 19, 19, 1),
                    //height: 1.2, 
                  ),),
                        ),
            )),
          Positioned(
            top:660,
            left: 70,
            child:  Container( 
              height: 47,
              width: 261,
              alignment: Alignment.center,
            decoration:BoxDecoration( 
              color:const Color.fromRGBO(19, 19, 19, 1),
              borderRadius:const  BorderRadius.all(
                Radius.circular(19)
                ),
                border: Border.all(color:const Color.fromRGBO(255, 61, 0, 1),width: 1)
            ),
            child: Text("Continue with Email",style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color:const Color.fromRGBO(255, 61, 0, 1),
                  //height: 1.2, 
                ),),
          )),
          Positioned(
            top: 731, // Adjust this value based on your layout requirements
            left: 88,
            
            child: SizedBox(
              width: 247,
              height: 34,
              
              child: Text(
                "by continuing you agree to terms of services and  Privacy policy",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color:Color.fromARGB(104, 203, 200, 200),
                  height: 1, 
                ),
              ),
            ),
          ),
      ],
    ),
  );
 }
}
