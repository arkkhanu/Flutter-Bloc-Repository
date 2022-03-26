import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloctheme/services/api_service.dart';
import 'package:flutterbloctheme/services/connectivity_service.dart';
import 'package:flutterbloctheme/ui/todo_ui.dart';
import 'package:flutterbloctheme/ui/work_ui.dart';
import 'package:flutterbloctheme/ui/work_ui_.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => APIService(),
          ),
          RepositoryProvider(
            create: (context) => ConnectivityService(),
          )
        ],
        // child: const TodoScreen(),
        child: const WorkScreen(),
      ),
    );
  }
}
