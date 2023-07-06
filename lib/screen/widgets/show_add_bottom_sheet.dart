import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/model/task_model.dart';
import '../../firebase/firebase_fuction.dart';
import 'custom_text_form_field.dart';

class showAddBootomSheet extends StatefulWidget {

  @override
  State<showAddBootomSheet> createState() => _showAddBootomSheetState();
}

class _showAddBootomSheetState extends State<showAddBootomSheet> {
  var formkey = GlobalKey<FormState>();
  var selectedDate =  DateUtils.dateOnly( DateTime.now());
var titlecontroller=TextEditingController();
var descriptioncontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Add new Task",
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            CostumTextFormField(
              controller: titlecontroller,
                hinttitle: "Task Title", labeltitle: "Task Title"),
            const SizedBox(
              height: 10,
            ),
            CostumTextFormField(
              controller: descriptioncontroller,
                hinttitle: "Task Description", labeltitle: "Task Description"),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: Text(
                "Add new Task",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge,
              ),
            ),
            InkWell(
              onTap: () {
                chooseDate(context);
              },
              child: Text(
                selectedDate.toString().substring(0, 10),
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.grey),
              ),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.5,
              child: ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      TaskModel task = TaskModel(description: descriptioncontroller.text,
                          title: titlecontroller.text,
                          status: false,
                          date: selectedDate.millisecondsSinceEpoch);
                      FireBaseFunction.addTaskeToFireStore(task);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    "Add Task",
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }

  void chooseDate(BuildContext context) async {
    DateTime?chooseDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 356)));
    if (chooseDate != null) {
      selectedDate =DateUtils.dateOnly(chooseDate) ;
      setState(() {

      });
    }
  }
}
