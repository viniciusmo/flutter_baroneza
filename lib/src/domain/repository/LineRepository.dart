import 'package:baroneza/src/domain/Line.dart';

abstract class LineRepository {
  Future<List<Line>> all() => null;
}
