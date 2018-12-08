import 'dart:async';

import 'package:baroneza/src/domain/line.dart';
import 'package:baroneza/src/presentation/bloc/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class LinesBloc implements BlocBase {
  final LinesRepository _repository;
  final _allLines = PublishSubject<List<Line>>();

  Observable<List<Line>> get outAllLines => _allLines.stream;

  StreamSink<List<Line>> get _inAllLines => _allLines.sink;

  LinesBloc(this._repository);

  void getAllLines() async {
    List<Line> lines = await _repository.all();
    _inAllLines.add(lines);
  }

  void dispose() {
    _allLines.close();
  }
}
