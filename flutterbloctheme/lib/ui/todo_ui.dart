import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloctheme/bloc/todo/todo_bloc.dart';
import 'package:flutterbloctheme/bloc/todo/todo_events.dart';
import 'package:flutterbloctheme/bloc/todo/todo_state.dart';
import 'package:flutterbloctheme/services/api_service.dart';
import 'package:flutterbloctheme/services/connectivity_service.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(RepositoryProvider.of<APIService>(context),
          RepositoryProvider.of<ConnectivityService>(context))
        ..add(TodoEventFetchSingleTodo()),
      child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
            debugger();
            if (state is TodoStateInitial) {
              return Center(
                  child: Container(
                child: Text("Initial"),
              ));
            }
            if (state is TodoStateLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is TodoStateLoadedState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Text(state.todoModel.id.toString()),
                    Text(state.todoModel.userId.toString()),
                    Text(state.todoModel.title.toString()),
                    // CheckboxListTile(
                    //     value: state.todoModel.completed,
                    //     onChanged: (_) {
                    //       BlocProvider.of<TodoBloc>(context)
                    //           .add(TodoEventUpdate(todoModel: state.todoModel));
                    //     }),
                    BlocConsumer<TodoBloc, TodoState>(
                        builder: (context, _state) {
                      debugger();
                      return _state is TodoStateLoadedState
                          ? CheckboxListTile(
                              value: _state.todoModel.completed,
                              onChanged: (bool) {
                                // debugger();
                                BlocProvider.of<TodoBloc>(context).add(
                                    TodoEventUpdate(
                                        todoModel: state.todoModel));
                              })
                          : Container(
                              child: Text("Not Found"),
                            );
                    }, listener: (_, s) {
                      debugger();
                      if (s is TodoStateLoadedState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("TodoLoadedStaate")));
                      }

                      int i = 0;
                    }),

                    // Text(state.todoModel.completed.toString()),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<TodoBloc>(context)
                              .add(TodoEventFetchSingleTodo());
                        },
                        child: Text("Hit Api"))
                  ],
                ),
              );
            }
            if (state is NoInternetState) {
              return Center(
                child: Container(
                  child: Text("No Internet"),
                ),
              );
            }
            return Container();
          })),
    );
  }
}
