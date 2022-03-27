import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../models/todo_model.dart';

@immutable
abstract class TodoState extends Equatable {}

class TodoStateInitial extends TodoState {
  @override
  List<Object?> get props => [];
}
class TodoStateLoading extends TodoState {
  @override
  List<Object?> get props => [];
}
class TodoStateError extends TodoState {
  @override
  List<Object?> get props => [];
}
class TodoStateNoInternet extends TodoState {
  @override
  List<Object?> get props => [];
}
class TodoStateLoaded extends TodoState {
  final List<TodoModel> todoModelList;

  TodoStateLoaded({required this.todoModelList});

  @override
  List<Object> get props => [todoModelList];
}
