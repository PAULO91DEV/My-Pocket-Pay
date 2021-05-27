import 'package:my_pocket_pay/domain/entities/login_entity.dart';
import 'package:my_pocket_pay/domain/repositories/update_account_repository.dart';
import 'package:mobx/mobx.dart';
part 'activation_location_controller.g.dart';

class ActivationLocationController = ActivationLocationControllerBase
    with _$ActivationLocationController;

abstract class ActivationLocationControllerBase with Store {
  final LoginResponseEntity loginResponseEntity;

  final UpdateAccountRepository updateAccountRepository;
  ActivationLocationControllerBase(
    this.loginResponseEntity,
    this.updateAccountRepository,
  );

  @observable
  String codeActivation = "";

  @observable
  String accntId = "";

  @observable
  String address = "";

  @observable
  String addressComplement = "";

  @observable
  String addressNumber = "";

  @observable
  String neighborhood = "";

  @observable
  String city = "";

  @observable
  bool isShow = false;

  @observable
  String state = "";

  @observable
  String postalCode = "";

  @observable
  String country = "";

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @computed
  bool get isEnabledButton =>
      this.address.isNotEmpty &&
      this.addressNumber.isNotEmpty &&
      this.neighborhood.isNotEmpty &&
      this.city.isNotEmpty &&
      this.state.isNotEmpty &&
      this.country.isNotEmpty &&
      this.postalCode.isNotEmpty;

  @action
  void setAccntId(String value) => this.accntId = value;

  @action
  void setAddress(String value) => this.address = value;

  @action
  void setAddressComplement(String value) => this.addressComplement = value;

  @action
  void setAddressNumber(String value) => this.addressNumber = value;

  @action
  void setNeighborhood(String value) => this.neighborhood = value;

  @action
  void setState(String value) => this.state = value;

  @action
  void setCity(String value) => this.city = value;

  @action
  void setCountry(String value) => this.country = value;

  @action
  void setPostalCode(String value) => this.postalCode = value;

  @action
  void getCep(String value) => this.codeActivation = value;

  @action
  void searchCep() {}

  @action
  void updatedAccountClicked(Function onResult) {
    this.isLoading = true;

    this
        .updateAccountRepository
        .postDeviceLocalByDeviceCode(
          loginResponseEntity.data.accntId, // this.accntId,
          this.address,
          this.addressComplement,
          this.addressNumber,
          this.neighborhood,
          this.city,
          this.state,
          this.postalCode,
          this.country,
        )
        .then((value) {
      print(value);
      String data = value.toString();
      print(data);
      onResult(value);
      this.isLoading = false;
    }).catchError((error) {
      print(error);
      this.isLoading = false;
      this.errorMessage =
          "Ops! Houve um problema em nossos servidores, tente novamente mais tarde! ";
      onResult(error);
    });
  }
}
