import 'package:baroneza/src/domain/LIneStatus.dart';
import 'package:baroneza/src/domain/Line.dart';
import 'package:baroneza/src/domain/LineType.dart';

class MapperLine {
  static Line fromJson(Map<String, dynamic> json) {
    return Line(json['id'], json['id'], json['name'],
        statusfromString(json["status"]["type"]), LineType.cptm);
  }

  static LineStatus statusfromString(String lineStatus) {
    switch (lineStatus) {
      case "ENDED":
        return LineStatus.ended;
        break;
      case "NORMAL":
        return LineStatus.normal;
        break;
      case "UNAVAILABLE":
        return LineStatus.normal;
        break;
      case "PARALYZED":
        return LineStatus.paralyzed;
        break;
      case "SLOW":
        return LineStatus.slow;
        break;
      default:
        return LineStatus.ended;
        break;
    }
  }
}
