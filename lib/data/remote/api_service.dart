import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:simpleauth/data/env.dart';
import 'package:simpleauth/domain/model/baseresponse.dart';

class ApiService {
  Future<Either<String, BaseReponse>> postLogin(
      String username, String password) async {
    try {
      // hit api
      //final response = await http.post(Uri.parse("$baseApiUrl/login"));
      return Right(BaseReponse(status: "Success", code: 200, data: ""));
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, BaseReponse>> posRegister(
      String email, String username, String password) async {
    try {
      // hit api
      //final response = await http.post(Uri.parse("$baseApiUrl/register"));

      return Right(BaseReponse(status: "Success", code: 200, data: ""));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
