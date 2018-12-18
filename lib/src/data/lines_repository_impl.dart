import 'dart:convert';

import 'package:baroneza/src/data/mapper/mapper_company.dart';
import 'package:baroneza/src/domain/company.dart';
import 'package:baroneza/src/domain/repository/lines_repository.dart';
import 'package:http/http.dart' as http;

class LinesRepositoryImpl implements LinesRepository {

  @override
  Future<List<Company>> all() async {
    final response =
        await http.get("https://us-central1-ligado-nos-trens.cloudfunctions.net/allLines");
    if (response.statusCode == 200) {
      var result = List<Company>();
      var companiesJson = json.decode(response.body);
      for (int i = 0; i < companiesJson.length; i++) {
        result.add(MapperCompany.fromJson(companiesJson[i]));
      }
      return result;
    } else {
      throw Exception('Failed to load line status');
    }
  }
}
