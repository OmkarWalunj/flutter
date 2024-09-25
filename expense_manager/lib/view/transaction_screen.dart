
import 'package:expense_manager/view/my_menudrawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});
  @override
  State createState() => TransactionScreenState();
}

class TransactionScreenState extends State {
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
                        height: 17,
                      ),
                      Text(
                        "Date",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 13),
                      ),
                      TextField(
                          decoration: InputDecoration(
                              hintText: "Date",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffix:
                                  const Icon(Icons.calendar_month_outlined))),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Amount",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 13),
                      ),
                      TextField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 30,
                          ),
                        ),
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Category",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 13),
                      ),
                      TextField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 30,
                          ),
                        ),
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Descreption",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 13),
                      ),
                      TextField(
                          decoration: InputDecoration(
                              hintText: "Description",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ))),
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
                  onTap: (){},
                  child: Container(
                    width: 123,
                    height: 40,
                
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(14, 161, 125, 1),
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: Center(
                      child: Text(
                            "Add",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color.fromRGBO(255,255,255,1)
                              ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        
        elevation: 0,
        title: Text(
          "June 2022",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),
        ),
        actions: [
          GestureDetector(
            child: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      drawer: myDrawer(context),
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, itemCount) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/5.jpg"),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Medicine",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400, fontSize: 15),
                              ),
                              const SizedBox(
                                width: 145,
                              ),
                              GestureDetector(
                                child: const Icon(
                                  Icons.remove_circle_rounded,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "500",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400, fontSize: 15),
                              ),
                            ],
                          ),
                          Text(
                            "Lorem Ipsum is simply dummy text of the ",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400, fontSize: 10),
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 179,
                              ),
                              Text(
                                "3 June | 11:50 AM",
                                style: GoogleFonts.poppins(
                                    color: Color.fromRGBO(0, 0, 0, 0.6),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Divider()
              ],
            );
          }),
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
                  "  Add Transaction ",
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
