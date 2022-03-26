import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloctheme/bloc/cart/work_event.dart';
import 'package:flutterbloctheme/bloc/cart/work_state.dart';
import 'package:flutterbloctheme/models/work_model.dart';

class WorkBloc extends Bloc<WorkEvent, WorkState> {
  WorkBloc() : super(WorkStateInitial()) {
    on<WorkEventGetAll>((event, emit) async {
      emit(WorkStateLoading());
      await Future.delayed(const Duration(seconds: 3)); // API Call
      List<WorkModel> li = [
        WorkModel(id: 0, name: "Math", isCompleted: false),
        WorkModel(id: 1, name: "Math", isCompleted: true),
        WorkModel(id: 2, name: "Math", isCompleted: true),
        WorkModel(id: 3, name: "Math", isCompleted: false),
        WorkModel(id: 4, name: "Math", isCompleted: false),
        WorkModel(id: 5, name: "Math", isCompleted: true),
      ];
      emit(WorkStateLoaded(listOfWorkModel: li));
    });

    on<WorkEventAdd>((event, emit) {
      if (state is WorkStateLoaded) {
        List<WorkModel> _inner = [];
        _inner.addAll((state as WorkStateLoaded).listOfWorkModel);
        _inner.add(event.workModel);
        emit(WorkStateLoaded(listOfWorkModel: _inner));
      }
    });

    on<WorkEventDelete>((event, emit) {
      if (state is WorkStateLoaded) {
        List<WorkModel> _inner = [];
        _inner.addAll((state as WorkStateLoaded).listOfWorkModel);
        _inner.remove(event.workModel);
        emit(WorkStateLoaded(listOfWorkModel: _inner));
      }
    });
    on<WorkEventUpdate>((event, emit) {
      if (state is WorkStateLoaded) {
        List<WorkModel> _inner = [];
        _inner.addAll((state as WorkStateLoaded).listOfWorkModel);
        for (var element in _inner) {
          if (element.id == event.workModel.id) {
            element.isCompleted = element.isCompleted == true ? false : true;
            break;
          }
        }
        emit(WorkStateLoaded(listOfWorkModel: _inner));
      }
    });
  }
}
