import 'package:baroneza/src/domain/company.dart';
import 'package:baroneza/src/presentation/bloc/list_item.dart';

class CompanyViewModel extends ListItem {
  final Company company;

  CompanyViewModel(this.company);
}
