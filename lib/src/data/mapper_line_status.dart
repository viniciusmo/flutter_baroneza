import 'package:baroneza/src/domain/line.dart';
import 'package:baroneza/src/domain/line_status.dart';

class MapperLineStatus {
  static LineStatus fromJson(Map<String, dynamic> json) {
    return LineStatus(json["name"],json["color"],json["description"]);
  }
}
