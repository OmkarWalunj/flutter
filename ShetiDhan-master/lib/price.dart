import 'package:demo_test1/pricedata.dart';
import 'package:flutter/material.dart';


class PricePage extends StatefulWidget {
  const PricePage({super.key});

  @override
  _PricePageState createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  late String selectedState;

  @override
  void initState() {
    super.initState();
    selectedState = priceData[0]['State']; // Set initial state
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Market Price",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedState,
              onChanged: (newValue) {
                setState(() {
                  selectedState = newValue!;
                });
              },
              items: priceData
                  .map<DropdownMenuItem<String>>(
                    (stateData) => DropdownMenuItem<String>(
                  value: stateData['State'],
                  child: Text(stateData['State']),
                ),
              )
                  .toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: priceData.length,
              itemBuilder: (context, item) {
                if (priceData[item]["State"] != selectedState) {
                  return const SizedBox.shrink(); // Hide if state doesn't match
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    // Your existing code for displaying data here
                    // ...
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // const SizedBox(
                        //   width: 10,
                        // ),
                        Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(
                                31, 58, 5, 0.5019607843137255),
                            borderRadius: BorderRadius.only(
                              topRight:Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: Text(priceData[item]["State"],style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(144, 193, 245, 0.5),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Kharif Crop",
                            style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(
                                244, 242, 245, 0.9411764705882353),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(color: Colors.black54,offset: Offset(5, 5),blurRadius: 0.8),
                            ]
                        ),
                        child: DataTable(
                          //  border: TableBorder.all(),
                          decoration:const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          //headingRowColor: MaterialStateProperty.all(const Color.fromRGBO(125, 218, 166, 0.5)),
                          columns: const [
                            DataColumn(label: Text("Crops",style: TextStyle( color: Colors.red,fontSize: 14,fontWeight: FontWeight.bold),)),
                            DataColumn(label: Text("2022-23",style: TextStyle( color: Colors.red,fontSize: 14,fontWeight: FontWeight.bold),)),
                            DataColumn(label: Text("2023-24",style: TextStyle( color: Colors.red,fontSize: 14,fontWeight: FontWeight.bold),)),
                          ],
                          rows: List.generate(
                            priceData[item]["Kharif Crop"].length,
                                (index) {
                              return DataRow(
                                cells: [
                                  DataCell(Text(
                                      priceData[item]["Kharif Crop"][index])),
                                  DataCell(Text(priceData[item]["2022-2023"]
                                  ["KHARIF CROPS"][index])),
                                  DataCell(Text(priceData[item]["2023-2024"]
                                  ["KHARIF CROPS"][index])),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(
                                226, 136, 241, 0.5019607843137255),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Rabbi Crop",
                            style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(
                                241, 200, 200, 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(color: Colors.black54,offset: Offset(5, 5),blurRadius: 0.5),
                            ]
                        ),
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text("Crops",style: TextStyle( color: Colors.red,fontSize: 14,fontWeight: FontWeight.bold),)),
                            DataColumn(label: Text("2022-23",style: TextStyle( color: Colors.red,fontSize: 14,fontWeight: FontWeight.bold),)),
                            DataColumn(label: Text("2023-24",style: TextStyle( color: Colors.red,fontSize: 14,fontWeight: FontWeight.bold),)),
                          ],
                          rows: List.generate(
                            priceData[item]["Rabbi Crop"].length,
                                (index) {
                              return DataRow(
                                cells: [
                                  DataCell(
                                      Text(priceData[item]["Rabbi Crop"][index])),
                                  DataCell(Text(priceData[item]["2022-2023"]
                                  ["RABI CROPS"][index])),
                                  DataCell(Text(priceData[item]["2023-2024"]
                                  ["RABI CROPS"][index])),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                   const SizedBox(
                      height: 40,
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
