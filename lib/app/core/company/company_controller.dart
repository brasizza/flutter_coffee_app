// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:howabout_coffee/app/data/models/company_model.dart';
import 'package:howabout_coffee/app/data/services/company/company_service.dart';

class CompanyController {
  final CompanyService _service;
  CompanyController({
    required CompanyService service,
  }) : _service = service;

  Future<CompanyModel?> init() async {
    return await _service.getCompany();
  }
}
