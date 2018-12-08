import 'package:baroneza/src/domain/line_status.dart';

class Line {
  String description;
  String name;
  LineStatus status;

  Line(this.description, this.name, this.status);

  @override
  String toString() {
    return "Line(description=$description name=$name  status=$status)";
  }
}
