import 'package:baroneza/src/domain/LIneStatus.dart';
import 'package:baroneza/src/domain/LineType.dart';

class Line {
  String description;
  String id;
  String name;
  LineStatus status;
  LineType type;

  Line(this.id, this.description, this.name, this.status, this.type);

  factory Line.fromJson(Map<String, dynamic> json) {
    return Line(
        json['id'], json['id'], json['name'], LineStatus.ended, LineType.cptm);
  }
}
