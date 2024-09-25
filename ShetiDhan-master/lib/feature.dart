// ignore_for_file: prefer_const_constructors

import 'package:demo_test1/screens/major_crop.dart';
import 'package:flutter/material.dart';

import 'diseasePage.dart';

class ShoppageWidget extends StatefulWidget {
  const ShoppageWidget({super.key});

  @override
  State<ShoppageWidget> createState() => _ShoppageWidgetState();
}

class _ShoppageWidgetState extends State<ShoppageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              border: Border.all(
                color: const Color.fromRGBO(0, 0, 0, 1),
                width: 1,
              ),
            ),
            child: Stack(children: <Widget>[
              Positioned(
                top: MediaQuery.of(context).size.height * 0.06875,
                left: MediaQuery.of(context).size.width * 0.0444,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9111,
                  height: MediaQuery.of(context).size.height * 0.03,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    children: const <Widget>[
                      Positioned(
                        top: 0,
                        left: 143,
                        child: Text('Shop',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              height: 1,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.132,
                left: MediaQuery.of(context).size.width * 0.044,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.427,
                  height: MediaQuery.of(context).size.height * 0.24,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width *
                              0.428, //Adjust these percentages
                          height: MediaQuery.of(context).size.height *
                              0.24, // Adjust these percentages
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                              topRight: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                              bottomLeft: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                              bottomRight: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                            ),
                            border: Border.all(
                              color: Colors.orange,
                              width: MediaQuery.of(context).size.width *
                                  0.008, // Adjust these percentages
                            ),
                            image: DecorationImage(
                              image: AssetImage('assets/images/Rectangle7.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 125,
                          left: 15,
                          child: Container(
                            height: 40,
                            width: 125,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color.fromRGBO(2, 177, 83, 0.73)),
                            child: GestureDetector(
                                onTap: () {},
                                child: Center(
                                  child: Text(
                                    'SEED',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromRGBO(252, 252, 252, 1),
                                      fontFamily: 'Poppins',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.038,
                                      fontWeight: FontWeight.normal,
                                      height: 1,
                                    ),
                                  ),
                                )),
                          ))
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.132,
                left: MediaQuery.of(context).size.width * 0.500,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.427,
                  height: MediaQuery.of(context).size.height * 0.24,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width *
                              0.428, //Adjust these percentages
                          height: MediaQuery.of(context).size.height *
                              0.24, // Adjust these percentages
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                              topRight: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                              bottomLeft: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                              bottomRight: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                            ),
                            border: Border.all(
                              color: Colors.orange,
                              width: MediaQuery.of(context).size.width *
                                  0.008, // Adjust these percentages
                            ),
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/Rectangle10.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: MediaQuery.of(context).size.height * 0.160,
                          left: MediaQuery.of(context).size.width * 0.022,
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color.fromRGBO(2, 177, 83, 0.73)),
                            child: GestureDetector(
                                onTap: () {},
                                child: Center(
                                  child: Text(
                                    'FRESH FROM FARM',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromRGBO(252, 252, 252, 1),
                                      fontFamily: 'Poppins',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.038,
                                      fontWeight: FontWeight.normal,
                                      height: 1,
                                    ),
                                  ),
                                )),
                          )),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height *
                    0.388, // Adjust these percentages
                left: MediaQuery.of(context).size.width *
                    0.044, // Adjust these percentages
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.427, // Adjust these percentages
                  height: MediaQuery.of(context).size.height *
                      0.24, // Adjust these percentages
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width *
                              0.427, //Adjust these percentages
                          height: MediaQuery.of(context).size.height *
                              0.24, // Adjust these percentages
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                              topRight: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                              bottomLeft: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                              bottomRight: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                            ),
                            border: Border.all(
                              color: Colors.orange,
                              width: MediaQuery.of(context).size.width *
                                  0.008, // Adjust these percentages
                            ),
                            image: DecorationImage(
                              image: AssetImage('assets/images/Rectangle8.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height *
                            0.160, // Adjust these percentages
                        left: MediaQuery.of(context).size.width *
                            0.038, // Adjust these percentages
                        child: Container(
                          height: 40,
                          width: 125,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromRGBO(2, 177, 83, 0.73)),
                          child: GestureDetector(
                              onTap: () {},
                              child: Center(
                                child: Text(
                                  'FERTILIZER',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromRGBO(252, 252, 252, 1),
                                    fontFamily: 'Poppins',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.038,
                                    fontWeight: FontWeight.normal,
                                    height: 1,
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height *
                    0.654, // Adjust these percentages
                left: MediaQuery.of(context).size.width *
                    0.500, // Adjust these percentages
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.428, // Adjust these percentages
                  height: MediaQuery.of(context).size.height *
                      0.24, // Adjust these percentages
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width *
                              0.428, // Adjust these percentages
                          height: MediaQuery.of(context).size.height *
                              0.24, // Adjust these percentages
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                              topRight: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                              bottomLeft: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                              bottomRight: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                            ),
                            border: Border.all(
                              color: Colors.orange,
                              width: MediaQuery.of(context).size.width *
                                  0.008, // Adjust these percentages
                            ),
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/Rectangle12.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: MediaQuery.of(context).size.height *
                              0.170, // Adjust these percentages
                          left: MediaQuery.of(context).size.width *
                              0.036, // Adjust these percentages
                          child: Container(
                            height: 40,
                            width: 125,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color.fromRGBO(2, 177, 83, 0.73)),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MajorCrops()));
                                },
                                child: Center(
                                  child: Text(
                                    'MAJOR CROPS',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromRGBO(252, 252, 252, 1),
                                      fontFamily: 'Poppins',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.038,
                                      fontWeight: FontWeight.normal,
                                      height: 1,
                                    ),
                                  ),
                                )),
                          )),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height *
                    0.654, // Adjust these percentages
                left: MediaQuery.of(context).size.width *
                    0.044, // Adjust these percentages
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.428, // Adjust these percentages
                  height: MediaQuery.of(context).size.height *
                      0.24, // Adjust these percentages
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width *
                              0.427, // Adjust these percentages
                          height: MediaQuery.of(context).size.height *
                              0.24, // Adjust these percentages
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                              topRight: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                              bottomLeft: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                              bottomRight: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                            ),
                            border: Border.all(
                              color: Colors.orange,
                              width: MediaQuery.of(context).size.width *
                                  0.008, // Adjust these percentages
                            ),
                            image: DecorationImage(
                              image: AssetImage('assets/images/Rectangle9.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height *
                            0.168, // Adjust these percentages
                        left: MediaQuery.of(context).size.width *
                            0.015, // Adjust these percentages
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width *
                              0.427, // Adjust these percentages
                          height: MediaQuery.of(context).size.height *
                              0.05, // Adjust these percentages
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: MediaQuery.of(context).size.height *
                                    0.000, // Adjust these percentages
                                left: MediaQuery.of(context).size.width *
                                    0.026, // Adjust these percentages
                                child: Container(
                                  height: 40,
                                  width: 125,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Color.fromRGBO(2, 177, 83, 0.73)),
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MapPage()));
                                      },
                                      child: Center(
                                        child: Text(
                                          'DISEASE',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                252, 252, 252, 1),
                                            fontFamily: 'Poppins',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.038,
                                            fontWeight: FontWeight.normal,
                                            height: 1,
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height *
                    0.390, // Adjust these percentages
                left: MediaQuery.of(context).size.width *
                    0.500, // Adjust these percentages
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.428, // Adjust these percentages
                  height: MediaQuery.of(context).size.height *
                      0.24, // Adjust these percentages
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width *
                              0.428, // Adjust these percentages
                          height: MediaQuery.of(context).size.height *
                              0.24, // Adjust these percentages
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                              topRight: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                              bottomLeft: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                              bottomRight: Radius.circular(
                                  MediaQuery.of(context).size.width *
                                      0.028), // Adjust these percentages
                            ),
                            border: Border.all(
                              color: Colors.orange,
                              width: MediaQuery.of(context).size.width *
                                  0.008, // Adjust these percentages
                            ),
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/Rectangle11.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height *
                            0.158, // Adjust these percentages
                        left: MediaQuery.of(context).size.width *
                            0.015, // Adjust these percentages
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width *
                              0.428, // Adjust these percentages
                          height: MediaQuery.of(context).size.height *
                              0.05, // Adjust these percentages
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 0,
                                left: 5,
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Color.fromRGBO(2, 177, 83, 0.73)),
                                  child: GestureDetector(
                                      onTap: () {},
                                      child: Center(
                                        child: Text(
                                          'PROTECTING CROP',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                252, 252, 252, 1),
                                            fontFamily: 'Poppins',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.038,
                                            fontWeight: FontWeight.normal,
                                            height: 1,
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
