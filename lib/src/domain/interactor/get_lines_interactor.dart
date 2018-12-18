import 'package:baroneza/src/domain/company.dart';
import 'package:baroneza/src/domain/repository/lines_repository.dart';

class GetLinesInteractor {

  final LinesRepository repository;

  GetLinesInteractor(this.repository);

  Stream<List<Company>> execute() {
    return repository.all().asStream();
  }

}
