import 'package:baroneza/src/data/LineRepositoryImpl.dart';

Future main() async {
  var lineRepository = LineRepositoryImpl();
  var result = await lineRepository.all();
  print(result);
}
