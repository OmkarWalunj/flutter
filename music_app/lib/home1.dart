import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/favarite.dart';

class MusicApp extends StatefulWidget {
  const MusicApp({super.key});
  @override
  State createState() => _MusicApp();
}

class _MusicApp extends State {
   int _selectedIndex = 2;
    final PageController _pageController = PageController(initialPage: 2);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  List<Map<String,String>> data=[{
    'image':"assets/images/03.png",
    'name':"Dead inside",
    'year':"2020"

  },
  {
    'image':"assets/images/04.png",
    'name':"Alone",
    'year':"2023"

  },
  {
    'image':"assets/images/05.png",
    'name':"Heartless",
    'year':"2023"

  },
  {
    'image':"assets/images/03.png",
    'name':"Dead inside",
    'year':"2020"

  },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
       
        body:  PageView(
        controller: _pageController,
        children: <Widget>[
          const Favorite(),
          Body1(),

        ],
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
       
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
 backgroundColor:const Color.fromRGBO(19, 19, 19, 1),
            icon: _selectedIndex == 0 ? Image.asset("assets/icons/1.png"):Image.asset("assets/icons/01.png"),label: "Favorite",),
          const BottomNavigationBarItem(
             backgroundColor:Color.fromRGBO(19, 19, 19, 1),
            icon: Icon(Icons.search), label: 'Search'),
          const BottomNavigationBarItem(
             backgroundColor:Color.fromRGBO(19, 19, 19, 1),
            icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
             backgroundColor:Color.fromRGBO(19, 19, 19, 1),
            icon: Icon(Icons.shop), label: 'Cart'),
          const BottomNavigationBarItem(
             backgroundColor:Color.fromRGBO(19, 19, 19, 1),
            icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:const Color.fromRGBO(230, 154, 21, 1),
        unselectedItemColor: const Color.fromRGBO(157, 178, 206, 1),
        unselectedLabelStyle: GoogleFonts.abel( 
          color: const Color.fromRGBO(157, 178, 206, 1),
          fontWeight: FontWeight.w400,
          fontSize: 12
        ),
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget Body1(){
    return SingleChildScrollView( 
      child: Column( 
        children: [ 
          Container(
                height: 367,
                 width: MediaQuery.of(context).size.width ,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/02.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox( height: 175,),
                      SizedBox(
                  height: 44,
                  width: 170,
                  child: Text(
                    "A.L.O.N.E",
                    style: GoogleFonts.inter(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                                ),
                                const SizedBox( height: 11,),
                                Container(
                    height: 37,
                    width: 127,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 46, 0, 1),
                        borderRadius: BorderRadius.all(Radius.circular(19))),
                    child: Text(
                      "Subscribe",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(19, 19, 19, 1),
                        height: 0.9,
                      ),
                    ),
                  ),
                  
                  
                     ],),
                ),
              ),
              const SizedBox( 
                height: 14,
              ),
              Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                 Container(
                  height: 7,
                  width: 21,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 46, 0, 1),
                      borderRadius: BorderRadius.all(Radius.circular(22))),
                ),
                const SizedBox( 
                width: 4,
              ), 
                Container(
                  height: 7,
                  width: 7,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(159, 159, 159, 1),
                      borderRadius: BorderRadius.all(Radius.circular(22))),
                )
                ,
                 const SizedBox( 
                width: 4,
              ),
                Container(
                  height: 7,
                  width: 7,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(159, 159, 159, 1),
                      borderRadius: BorderRadius.all(Radius.circular(22))),
                )
                ],
              ),
              const SizedBox( 
                height: 17,
              ),
              Row (
        children: [
        Container(
          padding:const EdgeInsets.only(left: 16),
                    height: 22,
                    width: 114,
                    child: Text(
                      "Discography",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(255, 46, 0, 1),
                        //height: 1.2,
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 17,
                    width: 54,
                    child: Text(
                      "See all",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(248, 162, 69, 1),
                        //height: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox( 
                    width: 20,
                  )
      
      ],),
      const SizedBox( 
                height: 19,
              ),
        SizedBox(
    width: MediaQuery.of(context).size.width , // Set a finite width
    height: 180, // Set a finite height
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 16.0,right: 16),
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              Container( 
                width: 119,
                height: 140,
                
                decoration: const BoxDecoration( 
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: ClipRRect( 
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(data[index]['image']!,fit: BoxFit.fill),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                height: 15,
                width: 99,
                alignment: Alignment.topLeft,
                child: Text(data[index]['name']!,style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(203, 200, 200, 1),
                        //height: 1.2,
                      ),),
              ),
                
               Container(
                height: 15,
                width: 30,
                alignment: Alignment.topLeft,
                child: Text(data[index]['year']!,style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(132, 125, 125, 1),
                        //height: 1.2,
                      ),),
              ),

            ],
          ),
        );
      },
    ),
  ), 
  const SizedBox( 
                height: 20,
              ), 
  Row (
        children: [
        Container(
                    height: 18,
                    width: 114,
                    padding:const EdgeInsets.only(left: 16),
                    child: Text(
                      "Popular singles",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(203, 200, 200, 1),
                        //height: 1.2,
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 17,
                    width: 54,
                    child: Text(
                      "See all",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(248, 162, 69, 1),
                        //height: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox( 
                    width: 20,
                  )
      
      ],), 
      ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 16),
            child: Row( 
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                Container( 
                  width: 67,
                  height: 72,
                  
                  decoration: const BoxDecoration( 
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: ClipRRect( 
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(data[index]['image']!,fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 15,
                      width: 99,
                      alignment: Alignment.topLeft,
                      child: Text(data[index]['name']!,style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(203, 200, 200, 1),
                              //height: 1.2,
                            ),),
                    ),
                     Container(
                  height: 15,
                  width: 30,
                  alignment: Alignment.topLeft,
                  child: Text(data[index]['year']!,style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(132, 125, 125, 1),
                          //height: 1.2,
                        ),),
                ),
                  ],
                ),
                  
                
                const Spacer(),
                Column( 
                  children: [ 
                    Container( 
                      height: 5,
                      width: 5,
                      decoration:const BoxDecoration( 
                        color: Color.fromRGBO(217, 217, 217, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                    ),
                     const SizedBox( 
                      height: 5,
                     ),
                      Container( 
                      height: 5,
                      width: 5,
                      decoration:const BoxDecoration( 
                        color: Color.fromRGBO(217, 217, 217, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                    ),
                    const SizedBox( 
                      height: 5,
                     ),
                      Container( 
                      height: 5,
                      width: 5,
                      decoration:const BoxDecoration( 
                        color: Color.fromRGBO(217, 217, 217, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                    )
                  ],
                ),
                const SizedBox( 
                  width: 20,
                )
      
              ],
            ),
          );
        },
      ),   
        ],
      ),
    );
  }
}
