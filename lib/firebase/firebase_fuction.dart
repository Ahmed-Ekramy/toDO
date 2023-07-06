import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/task_model.dart';
class FireBaseFunction {
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance.collection("Task").withConverter(
        fromFirestore: (snapshote, _) {
          return TaskModel.fromJson(snapshote.data()!);
        },
        toFirestore: (TaskModel, _) {
          return TaskModel.toJson();
        });
  }
  static Future<void> addTaskeToFireStore(TaskModel task)async {
    var collection=getTaskCollection();
    var docRef= collection.doc();
    task.id=docRef.id;
    return docRef.set(task);
  }
  static Stream<QuerySnapshot<TaskModel>> getTaskFromFireStore(DateTime date){
    return
        getTaskCollection()
            .where("date",isEqualTo:DateUtils.dateOnly(date).millisecondsSinceEpoch)
            .snapshots();
  }
  static Future<void>deleteTask(String id){
    return  getTaskCollection().doc(id).delete();
  }
  static Future<void>updateTask(String id,TaskModel taskModel){
    return  getTaskCollection().doc(id).update(taskModel.toJson());
  }
}