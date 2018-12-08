import 'dart:convert';
import 'package:baroneza/src/data/mapper_line.dart';
import 'package:baroneza/src/domain/line.dart';
import 'package:baroneza/src/domain/repository/line_repository.dart';
import 'package:http/http.dart' as http;

class LineRepositoryImpl implements LinesRepository {

  @override
  Future<List<Line>> all() async {
    final response =
        await http.get("http://api.jsonbin.io/b/5bf6018cbc0383590681e121");
    if (response.statusCode == 200) {
      var result = List<Line>();
      var linesJson = json.decode(response.body);
      for(int i = 0; i < linesJson["lines"].length; i++){
        result.add(MapperLine.fromJson(linesJson["lines"][i]));
      }
      return result;
    } else {
      throw Exception('Failed to load line status');
    }
  }
}
