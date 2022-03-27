import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloctheme/bloc/todo/todo_events.dart';
import 'package:flutterbloctheme/bloc/todo/todo_state.dart';
import 'package:flutterbloctheme/models/todo_model.dart';

import '../../services/api_service.dart';
import '../../services/connectivity_service.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final APIService _apiService;
  final ConnectivityService _connectivityService;

  TodoBloc(this._apiService, this._connectivityService)
      : super(TodoStateInitial()) {
    _connectivityService.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        print("No Internet");
        add(TodoEventNoInternet());
      } else {
        print("Internet");
        add(TodoEventLoadTodo());
      }
    });

    on<TodoEventLoadTodo>((event, emit) => onTodoEventLoadTodo(event, emit));
    on<TodoEventAddTodo>((event, emit) => onTodoEventAddTodo(event, emit));
    on<TodoEventUpdateTodo>(
        (event, emit) => onTodoEventUpdateTodo(event, emit));
    on<TodoEventDeleteTodo>(
        (event, emit) => onTodoEventDeleteTodo(event, emit));
    on<TodoEventClearCompletedTodo>(
        (event, emit) => onTodoEventClearCompletedTodo(event, emit));
    on<TodoEventToggleAllTodo>(
        (event, emit) => onTodoEventToggleAllTodo(event, emit));
  }

  onTodoEventLoadTodo(
      TodoEventLoadTodo todoEvent, Emitter<TodoState> emitter) async {
    emitter(TodoStateLoading());
    await Future.delayed(Duration(seconds: 2));
    final todoList = [
      TodoModel(id: "1", complete: false, note: "Some Note 1", task: "Done 1"),
      TodoModel(id: "2", complete: true, note: "Some Note 2", task: "Done 2"),
      TodoModel(id: "3", complete: true, note: "Some Note 3", task: "Done 3"),
      TodoModel(id: "4", complete: true, note: "Some Note 4", task: "Done 4"),
      TodoModel(id: "5", complete: false, note: "Some Note 5", task: "Done 5"),
    ];
    emitter(TodoStateLoaded(todoModelList: todoList));
  }

  onTodoEventAddTodo(TodoEventAddTodo todoEvent, Emitter<TodoState> emitter) {
    if (state is TodoStateLoaded) {
      final List<TodoModel> updatedTodoList =
          List.from((state as TodoStateLoaded).todoModelList)
            ..add(todoEvent.todoModel);
      emitter(TodoStateLoaded(todoModelList: updatedTodoList));
    }
  }

  onTodoEventUpdateTodo(
      TodoEventUpdateTodo todoEvent, Emitter<TodoState> emitter) {
    if (state is TodoStateLoaded) {
      // final List<TodoModel> updatedTodoList = (state as TodoStateLoaded)
      //     .todoModelList
      //     .map((singleTodo) => singleTodo.id == todoEvent.todoModelUpdate.id
      //         ? todoEvent.todoModelUpdate
      //         : singleTodo)
      //     .toList();

      final List<TodoModel> updatedTodoList =
          (state as TodoStateLoaded).todoModelList.map((e) {
        if (e.id == todoEvent.todoModelUpdate.id) {
          e = e.copyWith(
              complete: !(todoEvent.todoModelUpdate.complete ?? false));
        }
        return e;
      }).toList();

      emitter(TodoStateLoaded(todoModelList: updatedTodoList));
    }
  }

  onTodoEventDeleteTodo(
      TodoEventDeleteTodo todoEvent, Emitter<TodoState> emitter) {
    if (state is TodoStateLoaded) {
      final List<TodoModel> updatedTodoList = (state as TodoStateLoaded)
          .todoModelList
          .where((element) => element.id != todoEvent.todoModelDelete.id)
          .toList();

      emitter(TodoStateLoaded(todoModelList: updatedTodoList));
    }
  }

  onTodoEventClearCompletedTodo(
      TodoEventClearCompletedTodo todoEvent, Emitter<TodoState> emitter) {
    if (state is TodoStateLoaded) {
      final List<TodoModel> updatedTodoList = (state as TodoStateLoaded)
          .todoModelList
          .where((singleTodo) => !(singleTodo.complete ?? false))
          .toList();

      emitter(TodoStateLoaded(todoModelList: updatedTodoList));
    }
  }

  onTodoEventToggleAllTodo(
      TodoEventToggleAllTodo todoEvent, Emitter<TodoState> emitter) {
    if (state is TodoStateLoaded) {
      final allComplete = (state as TodoStateLoaded)
          .todoModelList
          .every((element) => element.complete ?? true);
      final List<TodoModel> updateTodoList = (state as TodoStateLoaded)
          .todoModelList
          .map((singleTodo) => singleTodo.copyWith(complete: !allComplete))
          .toList();
      emitter(TodoStateLoaded(todoModelList: updateTodoList));
    }
  }

// Future _saveTodos(List<TodoModel> todos) {
//   return todosRepository.saveTodos(
//     todos.map((todo) => todo.toEntity()).toList(),
//   );
// }
}
