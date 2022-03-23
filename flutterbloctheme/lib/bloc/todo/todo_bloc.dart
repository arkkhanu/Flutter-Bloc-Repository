import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloctheme/bloc/todo/todo_events.dart';
import 'package:flutterbloctheme/bloc/todo/todo_state.dart';
import 'package:flutterbloctheme/models/todo_model.dart';
import 'package:flutterbloctheme/services/api_service.dart';
import 'package:flutterbloctheme/services/connectivity_service.dart';

class TodoBloc extends Bloc<TodoEvents, TodoState> {
  final APIService _apiService;
  final ConnectivityService _connectivityService;

  TodoBloc(this._apiService, this._connectivityService)
      : super(TodoStateInitial()) {
    _connectivityService.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        print("No Internet");
        add(NoInternetEvent());
      } else {
        print("Internet");
        add(TodoEventFetchSingleTodo());
      }
    });

    on<TodoEventFetchSingleTodo>((event, emit) async {
      emit(TodoStateLoading());
      TodoModel? single = await _apiService
          .getSingleTodo(1)
          .catchError((e) => emit(TodoStateInitial()));
      if (single != null) {
        emit(TodoStateLoadedState(todoModel: single));
      } else {
        emit(TodoStateInitial());
      }
    });

    on<NoInternetEvent>((event, emit) {
      emit(NoInternetState());
    });
  }
}
