import 'package:my_pocket_pay/data/datasources/login/login_datasource.dart';
import 'package:my_pocket_pay/domain/entities/login_entity.dart';
import 'package:my_pocket_pay/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _dataSource;
  LoginRepositoryImpl(this._dataSource);

  @override
  Future<LoginResponseEntity> signin(
    String docNumber,
    String accntType,
    String activatationKey,
  ) {
    return this._dataSource.signin(
          docNumber,
          accntType,
          activatationKey,
        );
  }
}
