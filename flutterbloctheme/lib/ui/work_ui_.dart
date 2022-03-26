import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloctheme/bloc/cart/work_bloc.dart';
import 'package:flutterbloctheme/bloc/cart/work_event.dart';
import 'package:flutterbloctheme/bloc/cart/work_state.dart';

import '../models/work_model.dart';

class WorkAScreen extends StatefulWidget {
  const WorkAScreen({Key? key}) : super(key: key);

  @override
  _WorkAScreenState createState() => _WorkAScreenState();
}

class _WorkAScreenState extends State<WorkAScreen> {
  @override
  Widget build(BuildContext context) {
    print("ReBuild");
    return BlocProvider(
      create: (context) {
        print("ReBuild - BlocProvider");
        return WorkBloc()..add(WorkEventGetAll());
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("Work"),
          ),
          body: BlocBuilder<WorkBloc, WorkState>(builder: (context, state) {
            if (state is WorkStateLoading) {
              return Container(
                child: CircularProgressIndicator(),
              );
            }
            if (state is WorkStateLoaded) {
              print(state.listOfWorkModel.length.toString());
              return Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        // BlocProvider.of<WorkBloc>(context).add(WorkEventAdd());

                       BlocProvider.of<WorkBloc>(context).add(WorkEventAdd(
                            workModel: WorkModel(
                          id: state.listOfWorkModel.length,
                          name: "Some thing ${state.listOfWorkModel.length}",
                          isCompleted: false,
                        )));
                        // context.read<WorkBloc>()
                        //       .add(WorkEventAdd(
                        //       workModel: WorkModel(
                        //         id: state.listOfWorkModel.length,
                        //         name:
                        //         "Some thing ${state.listOfWorkModel.length}",
                        //         isCompleted: false,
                        //       )));
                      },
                      child: Text("ADD")),
                  SizedBox(
                    height: 20,
                  ),
                  BlocConsumer<WorkBloc,WorkState>(
                      builder: (context, _state) {
                        print("_State $state");
                        return Container(
                          child: Text("Consumer"),
                        );
                      },
                      listener: (_, ss) {
                        print("_Listner $state");
                      })
                  // Expanded(
                  //   child: ListView.builder(
                  //     shrinkWrap: true,
                  //     itemCount: state.listOfWorkModel.length,
                  //     itemBuilder: (context, index) {
                  //       return ListTile(
                  //         leading:
                  //         Text(state.listOfWorkModel[index].id.toString()),
                  //         title: Text(
                  //             state.listOfWorkModel[index].name ?? "Not Found"),
                  //         subtitle: Checkbox(
                  //             onChanged: (val) {
                  //
                  //             },
                  //             value: state.listOfWorkModel[index].isCompleted ??
                  //                 false),
                  //       );
                  //     },
                  //   ),
                  // )
                ],
              );
            }
            return Container(
              child: Text("Error Not Found State"),
            );
          })),
    );
  }
}
