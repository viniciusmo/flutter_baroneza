import 'dart:async';

import 'package:baroneza/src/domain/company.dart';
import 'package:baroneza/src/domain/interactor/get_lines_interactor.dart';
import 'package:baroneza/src/domain/line.dart';
import 'package:baroneza/src/domain/repository/lines_repository.dart';
import 'package:baroneza/src/presentation/bloc/bloc_provider.dart';
import 'package:baroneza/src/presentation/bloc/list_item.dart';
import 'package:baroneza/src/presentation/bloc/mapper_list_items.dart';
import 'package:rxdart/rxdart.dart';

class LinesBloc implements BlocBase {
  final GetLinesInteractor _interactor;
  final PublishSubject<List<ListItem>> _allLines =
      PublishSubject<List<ListItem>>();

  Stream<List<ListItem>> get outAllLines => _allLines.stream;

  LinesBloc(this._interactor);

  void getAllLines() {
    _interactor.execute().map((lines) {
      return MapperListItems.from(lines);
    }).listen((listItems) {
      _allLines.sink.add(listItems);
    });
  }

  void dispose() {
    _allLines.close();
  }
}
