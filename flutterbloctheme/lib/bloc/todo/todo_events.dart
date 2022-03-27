import 'package:equatable/equatable.dart';
import 'package:flutterbloctheme/models/todo_model.dart';

abstract class TodoEvent extends Equatable {}

class TodoEventLoadTodo extends TodoEvent {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return "TodoEventLoadTodo";
  }
}

class TodoEventAddTodo extends TodoEvent {
  final TodoModel todoModel;

  TodoEventAddTodo({required this.todoModel});

  @override
  List<Object?> get props => [todoModel];

  @override
  String toString() {
    return "TodoEventAddTodo";
  }
}

class TodoEventUpdateTodo extends TodoEvent {
  final TodoModel todoModelUpdate;

  TodoEventUpdateTodo({required this.todoModelUpdate});

  @override
  List<Object?> get props => [todoModelUpdate];

  @override
  String toString() {
    return "TodoEventUpdateTodo";
  }
}

class TodoEventDeleteTodo extends TodoEvent {
  final TodoModel todoModelDelete;

  TodoEventDeleteTodo({required this.todoModelDelete});

  @override
  List<Object?> get props => [todoModelDelete];
}

class TodoEventClearCompletedTodo extends TodoEvent {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return "TodoEventClearCompletedTodo";
  }
}

class TodoEventToggleAllTodo extends TodoEvent {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return "TodoEventToggleAllTodo";
  }
}
class TodoEventNoInternet extends TodoEvent {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return "TodoEventToggleAllTodo";
  }
}
