import 'package:baroneza/src/data/lines_repository_impl.dart';
import 'package:baroneza/src/domain/interactor/get_lines_interactor.dart';
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
        bloc: LinesBloc(GetLinesInteractor(LinesRepositoryImpl())),
        child: ListLines(),
      ),
    );
  }
}
