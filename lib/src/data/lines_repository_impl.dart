import 'package:baroneza/src/domain/company.dart';
import 'package:baroneza/src/domain/repository/lines_repository.dart';

class LinesRepositoryImpl implements LinesRepository {
  @override
  Future<List<Company>> all() async {
    return null;
//    final response =
//        await http.get("http://api.jsonbin.io/b/5bf6018cbc0383590681e121");
//    if (response.statusCode == 200) {
//      var result = List<Line>();
//      var linesJson = json.decode(response.body);
//      for(int i = 0; i < linesJson["lines"].length; i++){
//        result.add(MapperLine.fromJson(linesJson["lines"][i]));
//      }
//      return result;
//    } else {
//      throw Exception('Failed to load line status');
//    }
  }
}
