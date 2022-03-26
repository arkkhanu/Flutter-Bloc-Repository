import 'package:equatable/equatable.dart';
import 'package:flutterbloctheme/models/work_model.dart';

abstract class WorkEvent extends Equatable {}

class WorkEventGetAll extends WorkEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WorkEventGetSingle extends WorkEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WorkEventUpdate extends WorkEvent {
  WorkModel workModel;
  WorkEventUpdate({required this.workModel});
  @override
  // TODO: implement props
  List<Object?> get props => [workModel];
}

class WorkEventAdd extends WorkEvent {
  WorkModel workModel;
  WorkEventAdd({required this.workModel});
  @override
  // TODO: implement props
  List<Object?> get props => [workModel];
}

class WorkEventDelete extends WorkEvent {
  WorkModel workModel;
  WorkEventDelete({required this.workModel});
  @override
  // TODO: implement props
  List<Object?> get props => [workModel];
}
