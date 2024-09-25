
import 'package:expense_manager/view/my_menudrawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  @override
  State createState() => CategoryScreenState();
}

class CategoryScreenState extends State {
  void showBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        isDismissible: true,
        builder: (BuildContext context) {
          return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 500,
                          ),
                          Container(
                            width: 74,
                            height: 74,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(140, 128, 128, 0.2),
                                shape: BoxShape.circle),
                            child: Image.asset("assets/images/7.jpg"),
                          ),
                          Text(
                            "Add",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400, fontSize: 13),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Image URL",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 13),
                      ),
                      SizedBox(
                        width: 400,
                        height: 50,
                        child: TextField(
                            decoration: InputDecoration(
                          hintText: "Enter URL",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 30,
                            ),
                          ),
                        )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Category",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 13),
                      ),
                      SizedBox(
                        width: 400,
                        height: 50,
                        child: TextField(
                            decoration: InputDecoration(
                                hintText: "Enter category name",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 123,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(14, 161, 125, 1),
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                      child: Text(
                        "Add",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 13,
                )
              ]));
        });
  }

  Future<dynamic> showMyDialog() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Center(
            child: Text(
              "Delete Category",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          content: Text(
            "Are you sure you want to delete the selected category?",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Container(
                width: 100,
                height: 35,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(14, 161, 125, 1),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "Delete",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
              ),
            ),

            const SizedBox(
              width: 15,
            ),

            GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Container(
                width: 100,
                height: 35,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(140, 128, 128, 0.2),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.poppins(        
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
              ),
            ),

             const SizedBox(
              width: 23,
              height: 60,
            ),

          ],
        );
      },
    );
  }

  List<Map<String, String>> data = [
    {"Image": "4.jpg", "category": "Food"},
    {"Image": "5.jpg", "category": "Medicine"},
    {"Image": "11.jpg", "category": "Fuel"},
    {"Image": "9.jpg", "category": "Shopping"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Categories",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
          itemCount: 4,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showBottomSheet();
              },
              onLongPress: () {
                showMyDialog();
              },
              child: Container(
                  width: 145,
                  height: 150,
                  padding: EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.15),
                            offset: Offset(1, 2),
                            blurRadius: 8)
                      ]),
                  child: Column(
                    children: [
                      Image.asset("assets/images/${data[index]["Image"]}"),
                      const SizedBox(
                        height: 18,
                      ),
                      Text(
                        "${data[index]["category"]}",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ],
                  )),
            );
          },
        ),
      ),
      drawer: myDrawer(context),
      floatingActionButton: Container(
        width: 180,
        height: 50,
        child: FloatingActionButton(
            onPressed: () {
              showBottomSheet();
            },
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.add_circle_rounded,
                  color: Color.fromRGBO(14, 161, 125, 1),
                  size: 35,
                ),
                Text(
                  "  Add Category",
                  style: GoogleFonts.poppins(
                      color: Color.fromARGB(224, 0, 0, 0),
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ],
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
