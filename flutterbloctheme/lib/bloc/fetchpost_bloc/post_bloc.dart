
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloctheme/bloc/fetchpost_bloc/post_event.dart';
import 'package:flutterbloctheme/bloc/fetchpost_bloc/post_state.dart';

// class PostBloc extends Bloc<PostEvent,PostState>{
//   PostBloc(PostState initialState) : super(PostInitState());
//
//   @override
//   void emit(PostState state) {
//
//   }
// }

class PostCubit extends Cubit<PostState>{
  PostCubit() : super(PostInitState());

  fetchPost() async {
    emit(PostLoadingState());
    await Future.delayed(Duration(seconds: 3));


  }

}