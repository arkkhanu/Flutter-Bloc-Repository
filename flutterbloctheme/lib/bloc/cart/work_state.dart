import 'package:equatable/equatable.dart';
import 'package:flutterbloctheme/models/work_model.dart';

abstract class WorkState extends Equatable {}

class WorkStateInitial extends WorkState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class WorkStateLoading extends WorkState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class WorkStateLoaded extends WorkState {
  List<WorkModel> listOfWorkModel;

  WorkStateLoaded({required this.listOfWorkModel});

  @override
  List<Object?> get props => [listOfWorkModel];
}

class WorkStateFailed extends WorkState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
