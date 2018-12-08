import 'package:baroneza/src/domain/line_status.dart';

class Line {
  String description;
  String id;
  String name;
  LineStatus status;

  Line(this.id, this.description, this.name, this.status);

  @override
  String toString() {
    return "Line(id=$id description=$description name=$name  status=$status)";
  }
}
