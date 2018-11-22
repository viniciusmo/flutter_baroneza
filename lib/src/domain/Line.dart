import 'package:baroneza/src/domain/LIneStatus.dart';
import 'package:baroneza/src/domain/LineType.dart';

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
