

import 'dart:convert';
import 'dart:developer';

import 'package:flutterbloctheme/models/todo_model.dart';
import 'package:http/http.dart' as http;

class APIService{
  Future<TodoModel?> getSingleTodo(int id) async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos/$id"));

    if(response.statusCode == 200){
      return TodoModel.fromJson(json.decode(response.body));
    }else{
      return null;
    }
  }
}