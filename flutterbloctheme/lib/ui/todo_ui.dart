import 'dart:developer';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloctheme/bloc/todo/todo_bloc.dart';
import 'package:flutterbloctheme/bloc/todo/todo_events.dart';
import 'package:flutterbloctheme/bloc/todo/todo_state.dart';
import 'package:flutterbloctheme/models/todo_model.dart';
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
        ..add(TodoEventLoadTodo()),
      child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
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
            if (state is TodoStateLoaded) {
              return Column(
                children: [
                  Wrap(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<TodoBloc>(context)
                                .add(TodoEventLoadTodo());
                          },
                          child: Text("Refresh")),
                      VerticalDivider(),
                      ElevatedButton(
                          onPressed: () {
                            // BlocProvider.of<TodoBloc>(context).add(TodoEventLoadTodo());

                            context.read<TodoBloc>().add(TodoEventAddTodo(
                                todoModel: TodoModel(
                                    id: state.todoModelList.length.toString(),
                                    task: state.todoModelList.length.toString(),
                                    note:
                                        "Some Note ${state.todoModelList.length}",
                                    complete: false)));
                          },
                          child: Text("ADD")),
                      VerticalDivider(),
                      ElevatedButton(
                          onPressed: () {
                            // BlocProvider.of<TodoBloc>(context).add(TodoEventLoadTodo());
                            context
                                .read<TodoBloc>()
                                .add(TodoEventToggleAllTodo());
                          },
                          child: Text("Toggle All")),
                      VerticalDivider(),
                      ElevatedButton(
                          onPressed: () {
                            // BlocProvider.of<TodoBloc>(context).add(TodoEventLoadTodo());

                            context
                                .read<TodoBloc>()
                                .add(TodoEventClearCompletedTodo());
                          },
                          child: Text("Clear All")),
                    ],
                  ),
                  DropdownSearch<TodoModel>(

                 items: state.todoModelList,
                    onChanged: (ch){
                   print(ch);
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.todoModelList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onLongPress: () {
                            BlocProvider.of<TodoBloc>(context).add(
                                TodoEventDeleteTodo(
                                    todoModelDelete:
                                        state.todoModelList[index]));
                          },
                          leading:
                              Text(state.todoModelList[index].id.toString()),
                          title: Text(
                              state.todoModelList[index].task ?? "Not Found"),
                          subtitle: Checkbox(
                              onChanged: (val) {
                                BlocProvider.of<TodoBloc>(context).add(
                                    TodoEventUpdateTodo(todoModelUpdate: state.todoModelList[index]));
                              },
                              value:
                                  state.todoModelList[index].complete ?? false),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              );
            }
            if (state is TodoStateNoInternet) {
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
