import 'package:equatable/equatable.dart';

abstract class PostState extends Equatable {
  @override
  List<Object> get props => [];
}

class PostInitState extends PostState{}
class PostLoadingState extends PostState{}

class PostErrorState extends PostState{
  final error;
  PostErrorState({this.error});
}