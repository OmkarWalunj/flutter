import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:todospring/controller/user_controller.dart';
import 'package:todospring/model/task_data.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}


class _ToDoAppState extends State<ToDoApp> {
   String dropdownValue = 'Not Done';
   @override
   void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
      getTaskData();
    });

  }
  void editcard(bool doedit, Data? cardobj) {
    showBottomSheet(true, cardobj);
  }

  void submit(bool doedit, [Data? cardobj]) async {
    if (titleController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty &&
        dateController.text.trim().isNotEmpty) {
      if (!doedit) {
         await putTask(titleController.text.trim(),
            descriptionController.text.trim(), dateController.text.trim());
          await getTaskData();  
        setState(() {});
      } else {
        cardobj!.cardTitle = titleController.text;
        cardobj.cardDescription = descriptionController.text;
        cardobj.cardDate = dateController.text;
        if(dropdownValue =="Done"){
          cardobj.status=true;
        }else{
          cardobj.status=false;
        }
        await updateTask(cardobj.tid,cardobj.cardTitle,cardobj.cardDescription,cardobj.cardDate,cardobj.status);
       await getTaskData();
        setState(() {
          
        });
      }
    }
  }

  void showBottomSheet(bool doedit, [Data? cardobj]) {

    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),

        // isDismissible: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(
                        height: 20,
                      ),
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
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Title",
                            style: GoogleFonts.quicksand(
                              color: const Color.fromRGBO(0, 139, 148, 1),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding:const EdgeInsets.all(8.0),
                        child: TextField(
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
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Description",
                            style: GoogleFonts.quicksand(
                              color: const Color.fromRGBO(0, 139, 148, 1),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                            controller: descriptionController,
                            decoration: InputDecoration(
                                hintText: "Description",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Date",
                            style: GoogleFonts.quicksand(
                              color: const Color.fromRGBO(0, 139, 148, 1),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
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
                                DateFormat('yyyy-MM-dd').format(pickedDate!);
                        
                            setState(() {
                              dateController.text = formatedDate;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  
                   Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Status",
                            style: GoogleFonts.quicksand(
                              color: const Color.fromRGBO(0, 139, 148, 1),
                            ),
                          ),
                        ],
                      ),

                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: DropdownButtonFormField<String>(
                                 value: dropdownValue,
                                 hint: Text('Select Status'),
                                 onChanged: (String? newValue) {
                                   setState(() {
                    dropdownValue = newValue!;
                                   });
                                 },
                                 items: <String>['Done', 'Not Done']
                    .map<DropdownMenuItem<String>>((String value) {
                                   return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                                   );
                                 }).toList(),
                                 decoration:const InputDecoration(
                                   border: OutlineInputBorder(),
                                   contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                 ),
                               ),
                 ),
                 const SizedBox(
                        height: 10,
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
                            submit(doedit, cardobj);
                          }
                          Navigator.of(context).pop();
                          titleController.clear();
                          descriptionController.clear();
                          dateController.clear();
                        },
                        child: const Text("submit"),
                      )),
                       const SizedBox(
                    height: 40,
                  ),
                ])),
          );
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
          itemCount: tasks.length,
          itemBuilder: (context, itemCount) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
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
                        Text("${tasks[itemCount].cardTitle}",
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
                              "${tasks[itemCount].cardDescription}",
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
                          "${tasks[itemCount].cardDate}",
                          style: GoogleFonts.getFont(
                            "Quicksand",
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        tasks[itemCount].status! ?
                         Text(
                          "Status : Done",
                          style: GoogleFonts.getFont(
                            "Quicksand",
                            fontSize: 11,
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ) : Text(
                          "Status : Not Done",
                          style: GoogleFonts.getFont(
                            "Quicksand",
                            fontSize: 11,
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            titleController.text = tasks[itemCount].cardTitle!;
                            descriptionController.text =
                                tasks[itemCount].cardDescription!;
                            dateController.text = tasks[itemCount].cardDate!;
                            editcard(true, tasks[itemCount]);
                          },
                          child: const Icon(Icons.edit_outlined,
                              size: 18, color: Color.fromRGBO(0, 139, 148, 1)),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        GestureDetector(
                          onTap: () {
                            deleteTask(tasks[itemCount].tid);
                            setState(() {});
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
          showBottomSheet(false);
        },
        backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
        child: const Icon(Icons.add_outlined),
      ),
    );
  }
  
  Future<void> putTask(String taskname,String taskdescription,String taskdate ) async {
    int uid=Provider.of<UserController>(context, listen: false).modelobj!.uid!;
    bool status;
    if(dropdownValue =="Done"){
          status=true;
        }else{
          status=false;
        }
     Uri url=Uri.parse("http://10.0.2.2:8080/users/$uid/tasks");
    http.Response resourse= await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
"taskName": taskname,
"taskDescription": taskdescription,
"taskDate": taskdate,
"status": status,
"user": {
        "uid": uid
    }
      }));
      if (resourse.statusCode == 200) {
      log('Task Added');
      
    } else {
      
      log('Failed Task adding');
     
    }
  }
  List<Data> tasks=[];
  Future<void> getTaskData()async{
    int uid=Provider.of<UserController>(context, listen: false).modelobj!.uid!;
    Uri url=Uri.parse("http://10.0.2.2:8080/users/$uid/task");
    http.Response resourse= await http.get(url);
    var resourseData=json.decode(resourse.body);
    TaskDetails dataInfo=TaskDetails(resourseData);
    if (resourse.statusCode == 200) {
      log('Task get');
      
    } else {
      
      log('Failed Task getting');
     
    }

    setState(() {
      tasks=dataInfo.data!;
      log("$tasks");
    });
  }
  
  updateTask(int? tid, String? cardTitle, String? cardDescription, String? cardDate, bool? status) async{
    int uid=Provider.of<UserController>(context, listen: false).modelobj!.uid!;
     Uri url=Uri.parse("http://10.0.2.2:8080/users/$uid/task/$tid");
    http.Response resourse= await http.put(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
"taskName": cardTitle,
"taskDescription": cardDescription,
"taskDate": cardDate,
"status": status,
"user": {
        "uid": uid
    }
      }));
      if (resourse.statusCode == 200) {
      log('Task update');
      
    } else {
      
      log('Failed Task updating');
     
    }

  }
  
  void deleteTask(int? tid) async{
    int uid=Provider.of<UserController>(context, listen: false).modelobj!.uid!;
     Uri url=Uri.parse("http://10.0.2.2:8080/users/$uid/tasks/$tid");
    http.Response resourse= await http.delete(url);
    
    if (resourse.statusCode == 204) {
      log('Task delete');
      
    } else {
      
      log('Failed Task deletting');
     
    }
    await getTaskData();
  }
}
