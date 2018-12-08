import 'package:baroneza/src/domain/line.dart';
import 'package:baroneza/src/domain/line_type.dart';
import 'package:baroneza/src/presentation/bloc/company_view_model.dart';
import 'package:baroneza/src/presentation/bloc/line_view_model.dart';
import 'package:baroneza/src/presentation/bloc/row_type.dart';
import 'package:collection/collection.dart';

class MapperLine {

  static List<RowType> from(List<Line> lines) {
    groupBy(lines, (Line line) {
      return line.type;
    }).map((LineType type, List<Line> lines){
      List<RowType> rows = [];
      rows.add(_companyViewModelFromLineType(type));
      return rows;
    });
  }

  static LineViewModel _lineViewModelFromLine(Line line) {
      LineViewModel(statusColor, lineColor, line.description, line.id, line.name)
  }

  static CompanyViewModel _companyViewModelFromLineType(LineType lineType) {
    switch (lineType) {
      case LineType.cptm:
        return CompanyViewModel("CPTM", "uhaehuae");
        break;
      case LineType.viaquatro:
        return CompanyViewModel("CPTM", "uhaehuae");
        break;
      case LineType.metro:
        return CompanyViewModel("CPTM", "uhaehuae");
        break;
      default:
        return CompanyViewModel("CPTM", "uhaehuae");
        break;
    }

