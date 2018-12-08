import 'package:baroneza/src/domain/line.dart';
import 'package:baroneza/src/domain/line_status.dart';

class MapperLine {
  static Line fromJson(Map<String, dynamic> json) {
    LineStatus status =
        LineStatus(json["status"]["name"], json["status"]["color"]);
    return Line(json["description"], json["name"], status);
  }
}
