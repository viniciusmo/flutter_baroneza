import 'package:baroneza/src/data/mapper/mapper_line_status.dart';
import 'package:baroneza/src/domain/line.dart';
import 'package:baroneza/src/domain/line_status.dart';

class MapperLine {
  static Line fromJson(Map<String, dynamic> json) {
    LineStatus status = MapperLineStatus.fromJson(json);
    return Line(json["lineId"].toString(), json["name"], status, json["lineColor"]);
  }

}
