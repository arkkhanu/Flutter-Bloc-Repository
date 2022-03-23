import 'dart:collection';

import 'dart:developer';

class TodoModel {
  // {
  // "userId": 1,
  // "id": 1,
  // "title": "delectus aut autem",
  // "completed": false
  // }

  int? userId;
  int? id;
  String? title;
  bool? completed;

  TodoModel({this.id, this.userId, this.title, this.completed});

  TodoModel.fromJson(dynamic json) {

    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    completed = json["completed"];
  }

  Map<String, dynamic> toJson() {
    var map = HashMap<String, dynamic>();
    map["userId"] = userId;
    map["id"] = id;
    map["title"] = title;
    map["completed"] = completed;
    return map;
  }

  List<TodoModel> parseList(dynamic json) {
    List<TodoModel> list = json.map((e) => TodoModel.fromJson(e)).toList();
    return list;
  }
}
