import 'package:my_pocket_pay/domain/entities/login_entity.dart';
import 'package:mobx/mobx.dart';
part 'updated_account_controller.g.dart';

class CurrentAddressController = CurrentAddressControllerBase
    with _$CurrentAddressController;

abstract class CurrentAddressControllerBase with Store {
  final LoginResponseEntity loginResponseEntity;

  CurrentAddressControllerBase(
    this.loginResponseEntity,
  );

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';
}
