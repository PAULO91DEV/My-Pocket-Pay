import 'package:my_pocket_pay/data/datasources/updatedLocation/update_location_datasource.dart';
import 'package:my_pocket_pay/domain/entities/update_account_entity.dart';
import 'package:my_pocket_pay/domain/repositories/update_account_repository.dart';

class UpdateAccountRepositoryImpl implements UpdateAccountRepository {
  final UpdateAccountDataSource _dataSource;
  UpdateAccountRepositoryImpl(this._dataSource);

  @override
  Future<UpdateAccountEntity> postDeviceLocalByDeviceCode(
    String accntId,
    String address,
    String addressComplement,
    String addressNumber,
    String neighborhood,
    String city,
    String state,
    String postalCode,
    String country,
  ) {
    return this._dataSource.postDeviceLocalByDeviceCode(
          accntId,
          address,
          addressComplement,
          addressNumber,
          neighborhood,
          city,
          state,
          postalCode,
          country,
        );
  }
}
