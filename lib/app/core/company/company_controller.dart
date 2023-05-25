// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:howabout_coffee/app/data/models/company_model.dart';
import 'package:howabout_coffee/app/data/services/company/company_service.dart';

class CompanyController {
  CompanyModel? _company;
  final CompanyService _service;
  CompanyController({
    required CompanyService service,
  }) : _service = service;

  CompanyModel? get company => _company;

  Future<void> init() async {
    _company = await _service.getCompany();
  }
}
