// ignore_for_file: unused_local_variable

import 'package:demo_test1/WeatherH.dart';
import 'package:demo_test1/price.dart';
import 'package:demo_test1/product.dart';
import 'package:demo_test1/provider/auth_provider.dart';
import 'package:demo_test1/screens/homescreen.dart';
import 'package:demo_test1/screens/mycart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Feature.dart';
import 'ProductEntryScreen.dart';
import 'chatapp2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyButtomNavBarState();
}

class _MyButtomNavBarState extends State<MyBottomNavBar> {
  int myCurrentIndex = 0;
  List pages =  [
    const HomePage(),
    const ShoppageWidget(),
    const PricePage(),
    //UsersListPage(),
    ChatApp(),
    const HomeScreen1(),
  ];
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      extendBody: false,
      bottomNavigationBar: BottomNavigationBar(
          //backgroundColor: Colors.orange,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          currentIndex: myCurrentIndex,
          onTap: (index) {
            setState(() {
              myCurrentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.orange),
            BottomNavigationBarItem(
                icon: Icon(Icons.featured_play_list),
                label: "Feature",
                backgroundColor: Colors.orange),
            BottomNavigationBarItem(
                icon: Icon(Icons.price_check),
                label: "Price",
                backgroundColor: Colors.orange),
            BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: "Message",
                backgroundColor: Colors.orange),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
                backgroundColor: Colors.orange),
          ]),
      body: pages[myCurrentIndex],
    );
  }
}
class ImageTitle extends StatelessWidget {
  final String imagePath;

  const ImageTitle({required this.imagePath});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 60,
          width: 140,
          padding: const EdgeInsets.only(left: 5.0),
          child: Image(
            image: AssetImage(imagePath),
          ),
        ),
      ],
    );
  }
}

class _HomePage extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child:Scaffold(
        appBar: AppBar(
          flexibleSpace:const ImageTitle(imagePath: 'assets/images/horizontal_logo.png'),
          backgroundColor: Colors.orange,
          actions:  [
            IconButton(
              icon: const Icon(
                Icons.sell,
                color: Colors.black,
              ),
              onPressed: () {
                // Navigate to the ProductEntryScreen when Sell icon is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductEntryScreen()),
                );
              },
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {
                // Navigate to the ProductEntryScreen when Sell icon is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );

              },
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: ListView(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    clipBehavior: Clip.antiAlias,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          //strokeAlign: StrokeAlign.outside,
                        ),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: MediaQuery.of(context).size.width *
                              0.0444, // Adjust the left position based on the screen width
                          top: MediaQuery.of(context).size.height *
                              0.025, // Adjust the top position based on the screen height
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width *
                                0.319, // Adjust the width based on the screen width
                            height: MediaQuery.of(context).size.height *
                                0.06, // Adjust the height based on the screen height
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: SizedBox(
                                    /*width: MediaQuery.of(context).size.width *
                                        0.586,*/ // Adjust the width based on the screen width
                                    child: Text(
                                      'Hi  ${ap.userModel.name}\n',
                                      style:const  TextStyle(
                                        color: Colors.black,
                                        fontSize:14, // Adjust the font size based on the screen width
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: MediaQuery.of(context).size.height *
                                      0.033, // Adjust the top position based on the screen height
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.319, // Adjust the width based on the screen width
                                    child: Text(
                                      'Enjoy your services',
                                      style: TextStyle(
                                        color: const Color(0xFF585858),
                                        fontSize: MediaQuery.of(context)
                                            .size
                                            .width *
                                            0.033, // Adjust the font size based on the screen width
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width *
                              0.7078, // 280 / 360 (assuming base width is 360)
                          top: MediaQuery.of(context).size.height * 0.053,

                          child: SizedBox(
                            width: MediaQuery.of(context).size.width *
                                0.319, // 58 / 360 (assuming base width is 360)
                            //height: MediaQuery.of(context).size.height *
                            //   0.0139, // 10 / 720 (assuming base height is 720)

                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const WeatherHome()),
                                ); // Handle tap on text here
                              },
                              child: Text(
                                'Weather\n',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: const Color(0xFFFE234A),
                                    fontSize: MediaQuery.of(context).size.width *
                                        0.0389, // 14 / 360 (assuming base width is 360)
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height:
                                    0 // -0.41 / 360 (assuming base width is 360)
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: MediaQuery.of(context).size.height * 0.1125,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.958,
                            height: MediaQuery.of(context).size.height * 0.04,
                            child: Stack(
                              children: [
                                Positioned(
                                  left:
                                  MediaQuery.of(context).size.width * 0.0444,
                                  top: 0,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.8888,
                                    height:
                                    MediaQuery.of(context).size.height * 0.04,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          width: 1,
                                          color: Color(0xFFC2BCBC),
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left:
                                  MediaQuery.of(context).size.width * 0.0444,
                                  top: MediaQuery.of(context).size.height * 0.1,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.0444,
                                    height: MediaQuery.of(context).size.height *
                                        0.0444,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width:
                                          MediaQuery.of(context).size.width *
                                              0.0444,
                                          height:
                                          MediaQuery.of(context).size.height *
                                              0.0444,
                                          child: Stack(
                                            children: [
                                              Container(),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left:
                                  MediaQuery.of(context).size.width * 0.0444,
                                  top: MediaQuery.of(context).size.height *
                                      0.01, // Adjust the top position for the TextFormField
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.8888,
                                    height:
                                    MediaQuery.of(context).size.height * 0.03,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: "Search...",
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.search),
                                        contentPadding:
                                        EdgeInsets.only(bottom: 10),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width *
                              0.0416, // 15 / 360 (assuming base width is 360)
                          top: MediaQuery.of(context).size.height *
                              0.2083, // 150 / 720 (assuming base height is 720)
                          child: Container(
                            width: MediaQuery.of(context).size.width *
                                0.875, // 315 / 360 (assuming base width is 360)
                            height: MediaQuery.of(context).size.height *
                                0.1972, // 142 / 720 (assuming base height is 720)
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.875, // 315 / 360 (assuming base width is 360)
                                    height: MediaQuery.of(context).size.height *
                                        0.1972, // 142 / 720 (assuming base height is 720)
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFEDFCF5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: MediaQuery.of(context).size.width *
                                      0.075, // 27 / 360 (assuming base width is 360)
                                  top: MediaQuery.of(context).size.height *
                                      0.0583, // 42 / 720 (assuming base height is 720)
                                  child: Text(
                                    'Get free support from \n\n\n\n\n\nour customer services',
                                    style: TextStyle(
                                      color: const Color(0xFF545454),
                                      fontSize: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.0278, // 10 / 360 (assuming base width is 360)
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0.15,
                                      letterSpacing: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.0014, // 0.50 / 360 (assuming base width is 360)
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: MediaQuery.of(context).size.width *
                                      0.4444, // 160 / 360 (assuming base width is 360)
                                  top: MediaQuery.of(context).size.height *
                                      0.0486, // 35 / 720 (assuming base height is 720)
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.3888, // 140 / 360 (assuming base width is 360)
                                    height: MediaQuery.of(context).size.height *
                                        0.1319, // 95 / 720 (assuming base height is 720)
                                    decoration: const ShapeDecoration(
                                      image: DecorationImage(
                                        image:
                                        AssetImage('assets/images/call.jpg'),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: MediaQuery.of(context).size.width *
                                      0.075, // 27 / 360 (assuming base width is 360)
                                  top: MediaQuery.of(context).size.height *
                                      0.0222, // 16 / 720 (assuming base height is 720)
                                  child: Text(
                                    'Free Consultation',
                                    style: TextStyle(
                                      color: const Color(0xFF0B5E38),
                                      fontSize: MediaQuery.of(context)
                                          .size
                                          .width *
                                          0.0444, // 16 / 360 (assuming base width is 360)
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: MediaQuery.of(context).size.width * 0.075,
                                  top:
                                  MediaQuery.of(context).size.height * 0.1333,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.2472,
                                    height: MediaQuery.of(context).size.height *
                                        0.0417,
                                    child: InkWell(
                                      onTap: () async {
                                        const indianPhoneNumber =
                                            '+917057879221'; // Replace with the actual number

                                        final uri = Uri(
                                            scheme: 'tel',
                                            path:
                                            indianPhoneNumber); // Create Uri directly

                                        if (await canLaunchUrl(uri)) {
                                          // Pass the Uri object directly
                                          await launchUrl(uri);
                                        } else {
                                          print('Could not launch $uri');
                                        }
                                      },
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.2472,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.0417,
                                              decoration: ShapeDecoration(
                                                color: const Color(0xFFFE8723),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.0444,
                                            top: MediaQuery.of(context)
                                                .size
                                                .height *
                                                0.0069,
                                            child: Text(
                                              'Call Now',
                                              style: TextStyle(
                                                color: const Color(0xFF353535),
                                                fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.0361,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width *
                              0.7778, // 280 / 360 (assuming base width is 360)
                          top: MediaQuery.of(context).size.height *
                              0.0278, // 20 / 720 (assuming base height is 720)
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width *
                                0.1611, // 58 / 360 (assuming base width is 360)
                            height: MediaQuery.of(context).size.height *
                                0.0129, // 10 / 720 (assuming base height is 720)
                            child: const Icon(
                              Icons.cloud,
                              color: Colors.deepOrangeAccent,
                            ),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width *
                              0.0444, // 16 / 360 (assuming base width is 360)
                          top: MediaQuery.of(context).size.height *
                              0.4306, // 310 / 720 (assuming base height is 720)
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width *
                                0.811, // 40 / 360 (assuming base width is 360)
                            height: MediaQuery.of(context).size.height *
                                0.0333, // 24 / 720 (assuming base height is 720)
                            child: Text(
                              'Featured Product',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: MediaQuery.of(context).size.width *
                                    0.0444, // 16 / 360 (assuming base width is 360)
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width *
                              0.8194, // 295 / 360 (assuming base width is 360)
                          top: MediaQuery.of(context).size.height *
                              0.4375, // 315 / 720 (assuming base height is 720)
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width *
                                0.1223, // 44.02 / 360 (assuming base width is 360)
                            height: MediaQuery.of(context).size.height *
                                0.025, // 18 / 720 (assuming base height is 720)
                            child: GestureDetector(

                              onTap: (){
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => const ShoppageWidget()));
                              },
                              child: Text(
                                'See all',
                                style: TextStyle(
                                  color: const Color(0xFFFE8723),
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.0339, // 12 / 360 (assuming base width is 360)
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            )
                          ),
                        ),
                        Positioned(
                          bottom: 0, // Adjust this value to your needs
                          child: SingleChildScrollView(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.50,
                              width: MediaQuery.of(context).size.width,
                              child: Products(),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
      ),
    );
  }
}
