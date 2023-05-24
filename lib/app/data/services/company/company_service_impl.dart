// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:howabout_coffee/app/data/repositories/company/company_repository.dart';

import './company_service.dart';

class CompanyServiceImpl implements CompanyService {
  final CompanyRepository _repository;
  CompanyServiceImpl({
    required CompanyRepository repository,
  }) : _repository = repository;

  @override
  Future getCompany() async {
    return await _repository.getCompany();
  }
}
