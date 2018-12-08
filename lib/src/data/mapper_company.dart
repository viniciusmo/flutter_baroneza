
import 'package:baroneza/src/data/mapper_line.dart';
import 'package:baroneza/src/domain/company.dart';
import 'package:baroneza/src/domain/line.dart';

class MapperCompany {

  static Company fromJson(Map<String, dynamic> json) {
    var lines = List<Line>();

    for(int i = 0; i < json["lines"].length; i++){
      lines.add(MapperLine.fromJson(json["lines"][i]));
    }
    return Company(json["name"],json["image"],lines);
  }
}
