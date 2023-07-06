class TaskModel {
  String id;
  String description;
  String title;
  bool status;
  int date;

  TaskModel(
      {this.id = "",
      required this.description,
      required this.title,
      required this.status,
      required this.date});
  TaskModel .fromJson(Map<String,dynamic>json):this(
         id: json["id"],
    description: json["description"],
    title: json["title"],
    status: json["status"],
    date: json["date"],

  );
  Map<String,dynamic>toJson(){
    return{
     "id": id,
    "description":  description,
      "title":title,
      "status":status,
     "date" :date,
    };
  }

}
