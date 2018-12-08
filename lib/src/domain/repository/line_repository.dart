import 'package:baroneza/src/domain/line.dart';

abstract class LineRepository {
  Future<List<Line>> all() => null;
}
