import 'dart:ui';

import 'package:flutter/material.dart';

import 'Majorcrop_data.dart';

class MajorCrops extends StatefulWidget {
  const MajorCrops({super.key});
  @override
  State createState() => _MajorCrops();
}

class _MajorCrops extends State {
  final List<String> indianStates = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/map.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: (indianStates.length + 1) ~/
                      2, // Display half of the items
                  itemBuilder: (BuildContext context, int index) {
                    final evenIndex = index * 2; // Get the even index
                    final oddIndex = index * 2 + 1; // Get the odd index

                    return Row(
                      children: [
                        Expanded(
                          child: Card(
                            elevation:
                            5, // Add some elevation to the card for a shadow effect
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Add rounded corners to the card
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Same border radius as the card
                                gradient: const LinearGradient(
                                  colors: [
                                    Colors.blue,
                                    Colors.green
                                  ], // Define your gradient colors
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: ListTile(
                                title: Text(
                                  indianStates[evenIndex],
                                  style: const TextStyle(
                                      color: Colors
                                          .white), // Set text color to white
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MajorCropDetails(evenIndex),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                            width: 10), // Add some space between the columns
                        if (oddIndex <
                            indianStates
                                .length) // Check if the odd index is within the list length
                          Expanded(
                            child: Card(
                              elevation:
                              5, // Add some elevation to the card for a shadow effect
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Add rounded corners to the card
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Same border radius as the card
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.orange,
                                      Colors.red
                                    ], // Define your gradient colors
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: ListTile(
                                  title: Text(
                                    indianStates[oddIndex],
                                    style: const TextStyle(
                                        color: Colors
                                            .white), // Set text color to white
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MajorCropDetails(oddIndex),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            )),
      ),
    );
  }
}

class MajorCropDetails extends StatefulWidget {
  final int index;
  const MajorCropDetails(this.index, {super.key});

  @override
  _MajorCropDetailsState createState() => _MajorCropDetailsState();
}

class _MajorCropDetailsState extends State<MajorCropDetails> {
  bool isEnglish = true; // State variable to track language

  @override
  Widget build(BuildContext context) {
    final List<String> crops =
    (statesData[widget.index]['Crop'] as List).cast<String>();
    final List<String> imageUrls =
    (statesData[widget.index]['image_crop'] as List).cast<String>();
    final List<String> descriptionen =
    (statesData[widget.index]['description_en'] as List).cast<String>();
    final List<String> descriptionhi =
    (statesData[widget.index]['description_hi'] as List).cast<String>();

    List<String> descriptions = isEnglish ? descriptionen : descriptionhi;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${statesData[widget.index]["State"]}",
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(190, 246, 239, .5),
      ),
      body: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: ListView.builder(
          itemCount: crops.length,
          itemBuilder: (context, item) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${item + 1} .",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      crops[item],
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      border: Border.all(color: Colors.black, width: 3)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      imageUrls[item],
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return const Icon(Icons
                            .error); // Display an error icon if the image fails to load
                      },
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 350,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(243, 222, 165, 0.5),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: Text(
                    descriptions[item],
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          setState(() {
            isEnglish = !isEnglish;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: Color.fromRGBO(191, 222, 198, 0.5),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: Text(
            isEnglish ? "Switch to Hindi" : "Switch to English",
            style: const TextStyle(
                fontSize: 19, fontWeight: FontWeight.w700, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
