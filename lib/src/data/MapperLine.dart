import 'package:baroneza/src/domain/LIneStatus.dart';
import 'package:baroneza/src/domain/Line.dart';
import 'package:baroneza/src/domain/LineType.dart';

class MapperLine {

  static Line fromJson(Map<String, dynamic> json) {
    return Line(
        json['id'], json['id'], json['name'], LineStatus.ended, LineType.cptm);
  }

}
