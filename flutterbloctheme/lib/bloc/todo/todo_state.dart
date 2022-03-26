import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoStateInitial extends TodoState {
  @override
  List<Object?> get props => [];
}

class TodoStateLoading extends TodoState {
  @override
  List<Object?> get props => [];
}

class TodoStateLoadedState extends TodoState {
  TodoModel todoModel;

  TodoStateLoadedState({required this.todoModel});

  @override
  List<Object?> get props => [todoModel];
}

class NoInternetState extends TodoState {
  @override
  List<Object?> get props => [];
}

// class UpdateTodoToggle extends TodoState {
//   bool? toggle = false;
//
//   UpdateTodoToggle(this.toggle);
//
//   @override
//   List<Object?> get props => [];
// }
