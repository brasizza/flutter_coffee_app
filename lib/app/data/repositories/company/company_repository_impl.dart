import 'package:howabout_coffee/app/data/models/company_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import './company_repository.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  @override
  Future getCompany() async {
    final result = await ParseObject(CompanyModel.className).getAll();
    if (result.success) {
      print(result.result);
    }
  }
}
