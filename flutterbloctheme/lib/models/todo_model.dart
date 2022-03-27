import 'dart:collection';

class TodoModel {
  bool? complete;
  String? id;
  String? note;
  String? task;

  TodoModel({this.complete, this.id, this.note, this.task});

  TodoModel copyWith({
    bool? complete,
    String? id,
    String? note,
    String? task,
  }) {
    return TodoModel(
        task: task ?? this.task,
        note: note ?? this.note,
        complete: complete ?? this.complete,
        id: id ?? this.id);
  }

  TodoModel.fromJson(dynamic json) {
    complete = json["complete"];
    id = json["id"];
    note = json["note"];
    task = json["task"];
  }

  Map<String, dynamic> toJson() {
    var map = HashMap<String, dynamic>();
    map["complete"] = complete;
    map["id"] = id;
    map["note"] = note;
    map["task"] = task;
    return map;
  }

  List<TodoModel> parseList(dynamic json) {
    List<TodoModel> list = json.map((e) => TodoModel.fromJson(e)).toList();
    return list;
  }

  @override
  String toString() {
    return note ?? "Note";
  }
}
