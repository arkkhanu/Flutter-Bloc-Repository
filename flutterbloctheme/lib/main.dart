import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloctheme/bloc/theme_change/theme_change_bloc.dart';
import 'package:flutterbloctheme/bloc/theme_change/theme_change_event.dart';
import 'package:flutterbloctheme/bloc/theme_change/theme_change_state.dart';
import 'package:flutterbloctheme/services/api_service.dart';
import 'package:flutterbloctheme/services/connectivity_service.dart';
import 'package:flutterbloctheme/services/share_pref.dart';
import 'package:flutterbloctheme/ui/todo_ui.dart';
import 'package:flutterbloctheme/ui/work_ui.dart';

Future<void> main() async {
  await SharedPref.instance?.getSharedPreference();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeChangeBloc()..add(ThemeChangeEventLoadTheme()),
      child: BlocBuilder<ThemeChangeBloc, ThemeChangeState>(
        builder: (context, state){
          ThemeData themeData = ThemeData();
          if(state is ThemeChangeStateInitial){
            themeData = state.themeData;
          }
          if(state is ThemeChangeStateLoaded){
            themeData = state.themeData;
          }
          return  MaterialApp(
            title: 'Flutter Demo',
            theme: themeData,
            home: MultiRepositoryProvider(
              providers: [
                RepositoryProvider(
                  create: (context) => APIService(),
                ),
                RepositoryProvider(
                  create: (context) => ConnectivityService(),
                )
              ],
              child: const TodoScreen(),
              // child: const WorkScreen(),
            ),
          );
        },
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MultiRepositoryProvider(
//         providers: [
//           RepositoryProvider(
//             create: (context) => APIService(),
//           ),
//           RepositoryProvider(
//             create: (context) => ConnectivityService(),
//           )
//         ],
//         child: const TodoScreen(),
//         // child: const WorkScreen(),
//       ),
//     );
//   }
// }
