import 'dart:convert';
import 'package:baroneza/src/data/MapperLine.dart';
import 'package:baroneza/src/domain/Line.dart';
import 'package:baroneza/src/domain/repository/LineRepository.dart';
import 'package:http/http.dart' as http;

class LineRepositoryImpl implements LineRepository {
  @override
  Future<List<Line>> all() async {
    final response =
        await http.get("http://api.themoviedb.org/3/movie/popular?api_key");
    if (response.statusCode == 200) {
      var result = List<Line>();
      result.add(MapperLine.fromJson(json.decode(response.body)));
      return result;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
