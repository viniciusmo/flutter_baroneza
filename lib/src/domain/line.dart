import 'package:baroneza/src/domain/line_status.dart';

class Line {
  final String name;
  final LineStatus status;
  final String color;
  final String id;

  Line(this.id,this.name, this.status,this.color);

  @override
  String toString() {
    return "Line(name=$name  status=$status)";
  }
}
