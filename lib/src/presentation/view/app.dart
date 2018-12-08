import 'package:baroneza/src/data/line_repository_impl.dart';
import 'package:baroneza/src/presentation/bloc/bloc_provider.dart';
import 'package:baroneza/src/presentation/bloc/lines_bloc.dart';
import 'package:baroneza/src/presentation/view/list_lines.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BlocProvider(
        bloc: LinesBloc(LineRepositoryImpl()),
        child: ListLines(),
      ),
    );
  }
}
