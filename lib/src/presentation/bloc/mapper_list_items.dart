import 'package:baroneza/src/domain/company.dart';
import 'package:baroneza/src/presentation/bloc/company_view_model.dart';
import 'package:baroneza/src/presentation/bloc/line_view_model.dart';
import 'package:baroneza/src/presentation/bloc/list_item.dart';

class MapperListItems {
  static List<ListItem> from(List<Company> lines) {
    List<ListItem> items = [];
    lines.forEach((Company company) {
      items.add(CompanyViewModel(company));
      company.lines.forEach((line) {
        items.add(LineViewModel(line));
      });
    });
    return items;
  }
}
