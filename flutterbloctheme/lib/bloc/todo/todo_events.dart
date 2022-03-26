import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterbloctheme/models/todo_model.dart';

abstract class TodoEvents extends Equatable {}

class TodoEventFetchSingleTodo extends TodoEvents {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NoInternetEvent extends TodoEvents {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TodoEventUpdate extends TodoEvents {
  TodoModel todoModel;

  TodoEventUpdate({required this.todoModel});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
