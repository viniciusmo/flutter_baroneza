import 'package:baroneza/src/domain/LIneStatus.dart';
import 'package:baroneza/src/domain/Line.dart';
import 'package:baroneza/src/domain/LineType.dart';

class MapperLine {
  static Line fromJson(Map<String, dynamic> json) {
    return Line(
        json['id'],
        json['description'],
        json['name'],
        _statusfromString(json["status"]["type"]),
        _lineTypefromString(json["type"]));
  }

  static LineStatus _statusfromString(String lineStatus) {
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

  static LineType _lineTypefromString(String lineType) {
    switch (lineType) {
      case "CPTM":
        return LineType.cptm;
        break;
      case "METRO":
        return LineType.metro;
        break;
      case "VIAQUATRO":
        return LineType.viaquatro;
        break;
      default:
        return LineType.unknown;
        break;
    }
  }
}
