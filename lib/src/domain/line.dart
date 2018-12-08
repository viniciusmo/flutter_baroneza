import 'package:baroneza/src/domain/line_status.dart';
import 'package:baroneza/src/domain/line_type.dart';

class Line {
  String description;
  String id;
  String name;
  LineStatus status;
  LineType type;

  Line(this.id, this.description, this.name, this.status, this.type);

  @override
  String toString() {
    return "Line(id=$id description=$description name=$name  status=$status type=$type)";
  }
}
