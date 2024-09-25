
import 'package:expense_manager/view/my_menudrawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State createState() => GraphScreenState();
}

class GraphScreenState extends State {
  Map<String, double> data = {
    "Food": 650,
    "Fuel": 600,
    "Medicine": 500,
    "Entertainment": 475,
    "Shopping": 325
  };

  List<Map<String, String>> item = [
    {"Image": "4.jpg", "category": "Food", "price": "650"},
    {"Image": "5.jpg", "category": "Medicine", "price": "600"},
    {"Image": "11.jpg", "category": "Fuel", "price": "500"},
    {"Image": "9.jpg", "category": "Shopping", "price": "325"},
    {"Image": "5.jpg", "category": "Medicine", "price": "600"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: myDrawer(context),
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Graphs",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PieChart(
                dataMap: data,
                animationDuration: const Duration(milliseconds: 2000),
                chartType: ChartType.ring,
                chartRadius: 200,
                ringStrokeWidth: 30,
                centerText: "Total",
                chartValuesOptions:
                    const ChartValuesOptions(showChartValues: false),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/${item[index]["Image"]}",
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "${item[index]["category"]}",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "\u{20B9} ${item[index]["price"]}.00",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Icon(Icons.arrow_right_sharp)
                      ],
                    ),
                  );
                },
              ),
              const Divider(),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Total",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "\u{20B9} 2,550.00",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
