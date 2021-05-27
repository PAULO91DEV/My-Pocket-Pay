import 'package:my_pocket_pay/data/datasources/updatedLocation/update_location_datasource.dart';
import 'package:my_pocket_pay/data/entities/updated_account_request_entity.dart';
import 'package:my_pocket_pay/domain/entities/update_account_entity.dart';
import 'package:dio/dio.dart';
import 'package:my_pocket_pay/commons/constants.dart';

class UpdatedAccountDataSource implements UpdateAccountDataSource {
  final Dio _dio;
  UpdatedAccountDataSource(this._dio);

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
    return this
        ._dio
        .post(
          "$kUrlActivate",
          data: UpdateAccountRequestEntity(
            accntId: accntId,
            address: address,
            addressComplement: addressComplement,
            addressNumber: addressNumber,
            neighborhood: neighborhood,
            city: city,
            state: state,
            postalCode: postalCode,
            country: country,
          ).toJson(),
        )
        .then(
      (value) {
        if (value.statusCode == 201 || value.statusCode == 200) {
          print(value.data['Data']);
          UpdateAccountEntity updateAccountEntity =
              UpdateAccountEntity.fromJson(value.data);
          var result = value.data;
          print(result);

          return updateAccountEntity;
        } else {
          UpdateAccountEntity updateAccountEntity =
              UpdateAccountEntity.fromJson(value.data);
          print(updateAccountEntity.errorMessage);

          return updateAccountEntity;
        }
      },
    );
  }
}
