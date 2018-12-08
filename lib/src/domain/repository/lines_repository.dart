import 'package:baroneza/src/domain/company.dart';

abstract class LinesRepository {
  Future<List<Company>> all() => null;
}
