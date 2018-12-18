import 'package:baroneza/src/data/lines_repository_impl.dart';
import 'package:baroneza/src/domain/interactor/get_lines_interactor.dart';
import 'package:baroneza/src/presentation/bloc/lines_bloc.dart';
import 'package:baroneza/src/presentation/di/dependencies.dart';
import 'package:baroneza/src/presentation/view/app.dart';
import 'package:flutter/material.dart';

void main() {
  Dependencies.register<GetLinesInteractor>(
      GetLinesInteractor(LinesRepositoryImpl()));
  Dependencies.register<LinesBloc>(
      LinesBloc(Dependencies.get<GetLinesInteractor>()));
  runApp(App());
}
