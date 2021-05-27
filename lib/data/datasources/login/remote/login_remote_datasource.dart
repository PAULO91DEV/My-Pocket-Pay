import 'package:dio/dio.dart';
import 'package:my_pocket_pay/commons/constants.dart';
import 'package:my_pocket_pay/data/datasources/login/login_datasource.dart';
import 'package:my_pocket_pay/data/entities/login_request_entity.dart';
import 'package:my_pocket_pay/domain/entities/login_entity.dart';

class LoginRemoteDataSource implements LoginDataSource {
  final Dio _dio;
  LoginRemoteDataSource(this._dio);
  @override
  Future<LoginResponseEntity> signin(
    String docNumber,
    String accntType,
    String activatationKey,
  ) {
    return this
        ._dio
        .post(
          '$kUrlLogin/api/public/api/v2/GetAccount',
          data: LoginRequestEntity(
            docNumber: docNumber,
            accntType: accntType,
            activatationKey: activatationKey,
          ).toJson(),
        )
        .then(
      (value) {
        if (value.statusCode == 201 ||
            value.statusCode == 200 && value.data["Data"] != null) {
          print(value.data['Data']);
          LoginResponseEntity loginResponseEntity =
              LoginResponseEntity.fromJson(value.data);
          var result = value.data;
          print(result);
          var errors = result['Errors'];
          if (errors) {
            var response = result['ErrorMessage'];
            print(response);
            return loginResponseEntity;
          }
          return loginResponseEntity;
        } else {
          LoginResponseEntity loginResponseEntity =
              LoginResponseEntity.fromJson(value.data);
          print(loginResponseEntity.errorMessage);
          return loginResponseEntity;
        }
      },
    );
  }
}
