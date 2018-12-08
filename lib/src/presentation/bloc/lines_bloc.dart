import 'dart:async';

import 'package:baroneza/src/domain/company.dart';
import 'package:baroneza/src/domain/line.dart';
import 'package:baroneza/src/domain/repository/lines_repository.dart';
import 'package:baroneza/src/presentation/bloc/bloc_provider.dart';
import 'package:baroneza/src/presentation/bloc/list_item.dart';
import 'package:baroneza/src/presentation/bloc/mapper_list_items.dart';
import 'package:rxdart/rxdart.dart';

class LinesBloc implements BlocBase {
  final LinesRepository _repository;
  final _allLines = PublishSubject<List<ListItem>>();

  Observable<List<ListItem>> get outAllLines => _allLines.stream;

  StreamSink<List<ListItem>> get _inAllLines => _allLines.sink;

  LinesBloc(this._repository);

  void getAllLines() async {
    List<Company> lines = await _repository.all();
    _inAllLines.add(MapperListItems.from(lines));
  }

  void dispose() {
    _allLines.close();
  }
}
