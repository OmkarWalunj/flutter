import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

dynamic database;

void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  database = openDatabase(
    join(await getDatabasesPath(), "tolist.db"),
    version: 1,
    onCreate: (db, version) async{
      await db.execute(
        '''CREATE TABLE Card(
          cardId INTEGER PRIMARY KEY,
          cardTitle STRING,
          cardDescription STRING,
          cardDate STRING
        )'''
      );
    },
  );
  await getCardData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoApp(),
    );
  }
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class Card {
  int? cardId;
  String? cardTitle;
  String? cardDescription;
  String? cardDate;

  Card(this.cardTitle, this.cardDescription, this.cardDate);

  Map<String,dynamic> cardMap(){
    return {
      'cardTitle' : cardTitle,
      'cardDescription':cardDescription,
      'cardDate' : cardDate
    };
  }

}

Future insertCardData(Card obj) async {
  final localDB = await database;
  await localDB.insert(
    "Card",
    obj.cardMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

List<Map<String,dynamic>> taskli = [];

Future<void> getCardData() async {
  final localDB = await database;
  taskli = await localDB.query("Card");
  
  print(taskli);
}

Future<void> deleteCard(int id)async{
  final localDb = await database;
  await localDb.delete(
    'Card',
    where : 'cardId = ?',
    whereArgs : [id]
  );
  await getCardData();
  
}

Future<void> updateCard(Card obj,int? id)async{
  final localDb = await database;
  await localDb.update(
    'Card',obj.cardMap(),
    where: 'cardId = ?',
    whereArgs : [id]
  );
}

class _ToDoAppState extends State<ToDoApp> {
  void editcard(bool doedit,BuildContext context, [int? id]) {
    showBottomSheet(true,context, id);
  }

  void submit(bool doedit, [int? id]) async{
    if (titleController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty &&
        dateController.text.trim().isNotEmpty) {
      if (!doedit) {
        insertCardData(Card(titleController.text.trim(),
            descriptionController.text.trim(), dateController.text.trim()));
        await getCardData();
        setState(() {});
      } else {
        await updateCard(Card(titleController.text,descriptionController.text,dateController.text),id);
        await getCardData();
        setState(() {});
      }
      titleController.clear();
      descriptionController.clear();
      dateController.clear();
    }
  }

  void showBottomSheet(bool doedit,BuildContext context,[int? id]) {
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
                Text(
                  "Create Task",
                  style: GoogleFonts.getFont("Quicksand",
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(0, 0, 0, 1)),
                ),
                Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Title",
                      style: GoogleFonts.quicksand(
                        color: const Color.fromRGBO(0, 139, 148, 1),
                      ),
                    ),
                    TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          hintText: "Enter Task",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 30,
                              color: Color.fromRGBO(0, 139, 148, 1),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Description",
                      style: GoogleFonts.quicksand(
                        color: const Color.fromRGBO(0, 139, 148, 1),
                      ),
                    ),
                    TextField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                            hintText: "Description",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ))),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Date",
                      style: GoogleFonts.quicksand(
                        color: const Color.fromRGBO(0, 139, 148, 1),
                      ),
                    ),
                    TextField(
                      controller: dateController,
                      decoration: InputDecoration(
                          hintText: "Date",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffix: const Icon(Icons.calendar_month_outlined)),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2025),
                        );
                        String? formatedDate =
                            DateFormat.yMMMd().format(pickedDate!);

                        setState(() {
                          dateController.text = formatedDate;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(0, 139, 148, 1)),
                      ),
                      onPressed: () {
                        if (!doedit) {
                          submit(doedit);
                        } else {
                          submit(doedit, id);
                        }
                        Navigator.of(context).pop();
                      },
                      child: const Text("submit"),
                    )),
              ]));
        });
  }

  List containerColor = const [
    Color.fromRGBO(250, 232, 232, 1),
    Color.fromRGBO(232, 237, 250, 1),
    Color.fromRGBO(250, 249, 232, 1),
    Color.fromRGBO(250, 232, 250, 1),
  ];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
        title: Text(
          "To-do list",
          style: GoogleFonts.getFont(
            "Quicksand",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: taskli.length,
          itemBuilder: (context, itemCount) {
            return Padding(
              padding: const EdgeInsets.all(12.0),

              child: Container(
                margin: const EdgeInsets.all(25),
                width: 290,
                height: 112,
                decoration: BoxDecoration(
                    color: containerColor[itemCount % containerColor.length],
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        offset: Offset(0, 10),
                      ),
                    ]),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 87,
                        ),
                        Text("${taskli[itemCount]['cardTitle']}",
                            style: GoogleFonts.getFont("Quicksand",
                                fontWeight: FontWeight.w600, fontSize: 14)),
                        // const SizedBox(
                        //   height: 5,
                        // ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 52,
                          height: 52,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                          ),
                          child: const Icon(Icons.image),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(children: [
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: 243,
                            height: 44,
                            child: Text(
                              "${taskli[itemCount]['cardDescription']}",
                              style: GoogleFonts.getFont(
                                "Quicksand",
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ]),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          "${taskli[itemCount]['cardDate']}",
                          style: GoogleFonts.getFont(
                            "Quicksand",
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            titleController.text = taskli[itemCount]['cardTitle']!;
                            descriptionController.text =
                                taskli[itemCount]['cardDescription']!;
                            dateController.text = taskli[itemCount]['cardDate']!;
                            editcard(true,context, taskli[itemCount]['cardId']);
                          },
                          child: const Icon(Icons.edit_outlined,
                              size: 18, color: Color.fromRGBO(0, 139, 148, 1)),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        GestureDetector(
                          onTap: () async{
                            int id = taskli[itemCount]['cardId'];
                            await deleteCard(id);
                            setState(() {
                              print("deleted");
                            });
                          },
                          child: const Icon(
                            Icons.delete_outline,
                            size: 18,
                            color: Color.fromRGBO(0, 139, 148, 1),
                          ),
                        ),
                        const SizedBox(
                          width: 13,
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(false,context);
        },
        backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
        child: const Icon(Icons.add_outlined),
      ),
    );
  }
}