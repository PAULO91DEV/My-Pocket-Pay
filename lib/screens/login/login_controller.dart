import 'package:mobx/mobx.dart';
import 'package:my_pocket_pay/domain/entities/login_entity.dart';
import 'package:my_pocket_pay/domain/repositories/login_repository.dart';
part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final LoginRepository _loginRepository;

  LoginControllerBase(
    this._loginRepository,
  );

  @observable
  String usersType = "";

  @observable
  String docNumber = "";

  @observable
  String accntType = "";

  @observable
  bool enabledEditing = true;

  @observable
  bool isShow = false;

  @observable
  bool showPass = false;

  @observable
  String activatationKey = "";

  @observable
  LoginResponseEntity loginEntity = LoginResponseEntity();

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @computed
  bool get isLoginBottonEnabled =>
      this.docNumber.isNotEmpty &&
      this.usersType.isNotEmpty &&
      this.activatationKey.isNotEmpty;

  @action
  void setDoc(String value) => this.docNumber = value;

  @action
  void setUser(String value) => this.accntType = value;

  @action
  void setToken(String value) => this.activatationKey = value;

  @action
  void setUserType(String value) {
    print(value + " Value");
    this.usersType = value;
  }

  @action
  void init() {}

  @action
  void login(Function onResult) {
    if (usersType == "Usuário") {
      this.accntType = "User";
    } else {
      this.accntType = "Business";
    }
    this.isLoading = true;
    this
        ._loginRepository
        .signin(
          this.docNumber,
          this.accntType,
          this.activatationKey,
        )
        .then((result) {
      print(result);
      String data = result.toString();
      print(data);
      loginEntity = result;
      onResult(result);
      this.isLoading = false;
    }).catchError((error) {
      this.isLoading = false;
      this.errorMessage =
          "Ops! Houve um problema em nossos servidores, tente novamente mais tarde! ";
      onResult(error);
    });
  }
}
