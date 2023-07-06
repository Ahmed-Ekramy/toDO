import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:to_do/firebase/firebase_fuction.dart';
import 'package:to_do/model/task_model.dart';
import 'package:to_do/screen/widgets/task_item.dart';
import 'package:to_do/style/colors.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  DateTime date =  DateUtils.dateOnly(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DatePicker(
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: AppColors.primaryColor,
            selectedTextColor: Colors.white,
            onDateChange: (NewDate) {
              // New date selected
              setState(() {
                date = NewDate;
              });
            },
          ),
        ),
        StreamBuilder(
            stream: FireBaseFunction.getTaskFromFireStore(date),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text("Somting went wrong");
              }
              List<TaskModel>tasks = snapshot.data?.docs.map((e) {
                return e.data();
              }).toList() ?? [];
              if (tasks.isEmpty) {
                return Text('NO TASK');
              }
              return Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return TaskItem(tasks[index]);
                },itemCount: tasks.length,),
              );
            }
        )
      ]
      ,
    );
  }
}
