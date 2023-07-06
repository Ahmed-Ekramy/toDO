import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/model/task_model.dart';
import '../../firebase/firebase_fuction.dart';
import 'custom_text_form_field.dart';

class UpdateScreen extends StatefulWidget {
static const String routeName="UpdateScreen";
TaskModel taskModel;

UpdateScreen(this.taskModel);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  var formkey = GlobalKey<FormState>();
  var selectedDate =  DateUtils.dateOnly( DateTime.now());
  var titlecontroller=TextEditingController();
  var descriptioncontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child:  Container(
              margin: EdgeInsets.only(top: 60),
              height: MediaQuery.of(context).size.height*0.70,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(

                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Update Task",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyLarge,
                      ),
                      const SizedBox(
                        height: 50,
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
                        height: 30,
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
                      SizedBox(height: 100,),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.7,
                           height: MediaQuery
                            .of(context)
                            .size
                            .width * 0.2,
                        child: ElevatedButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                TaskModel task = TaskModel(description: descriptioncontroller.text,
                                    title: titlecontroller.text,
                                    status: false,
                                    date: selectedDate.millisecondsSinceEpoch);
                                FireBaseFunction.updateTask(task.id,task);
                                Navigator.pop(context);
                              }
                            },
                            child: Text(
                              "Update Task",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: Colors.white),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
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
