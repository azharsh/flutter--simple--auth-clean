import 'package:either_dart/either.dart';
import 'package:simpleauth/data/remote/api_service.dart';

import '../domain/model/baseresponse.dart';

class ApiRepository {
  final ApiService apiService = ApiService();

  Future<Either<String, BaseReponse>> postLogin(
      String username, String password) async {
    return apiService.postLogin(username, password);
  }

  Future<Either<String, BaseReponse>> postRegister(
      String email, String username, String password) async {
    return apiService.posRegister(email, username, password);
  }
}
