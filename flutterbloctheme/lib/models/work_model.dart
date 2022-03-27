import 'package:equatable/equatable.dart';

class WorkModel extends Equatable {
  int? id;
  String? name;
  bool? isCompleted = false;

  WorkModel({this.id, this.name, this.isCompleted});

  @override
  // TODO: implement props
  List<Object?> get props => [id, isCompleted, name];

  WorkModel copyWith({int? id, String? name, bool? isCompleted}) {
    return WorkModel(
        id: id, name: name, isCompleted: isCompleted == true ? false : true);
  }
}
