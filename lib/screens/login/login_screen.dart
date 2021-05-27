import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_pocket_pay/data/datasources/login/remote/login_remote_datasource.dart';
import 'package:my_pocket_pay/data/repositories/login_repository_impl.dart';
import 'package:my_pocket_pay/screens/login/login_controller.dart';
import 'package:my_pocket_pay/screens/updatedaccount/updated_account_screen.dart';
import 'package:my_pocket_pay/widgets/bottom_confirm_items.dart';
import 'package:my_pocket_pay/widgets/input_text_widget.dart';
import 'package:my_pocket_pay/commons/extensions.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final MaskedTextController cpfController =
      MaskedTextController(mask: '000.000.000-00');

  String nomeCidade = "";
  var _cidades = [
    'Usuário',
    'Empresa',
    '',
  ];

  var loginController;

  Dio createDio() {
    Dio dio = Dio();
    dio.interceptors.add(
      LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      ),
    );
    return dio;
  }

  @override
  void initState() {
    super.initState();
    this.loginController = LoginController(
      LoginRepositoryImpl(LoginRemoteDataSource(createDio())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 26.0, right: 26.0),
        color: Colors.white,
        alignment: Alignment.center,
        child: Form(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 88.0, left: 88.0, bottom: 30.0, top: 60.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red[700],
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.black),
                  ),
                  padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
                  child: Column(children: [
                    Image.asset(
                      "assets/image/MyPocketPay.PNG",
                      width: 250.0,
                    ),
                  ]),
                ),
              ),
              Observer(
                builder: (_) {
                  return InputTextWidget(
                    onTextChanged: this.loginController.setDoc,
                    controller: cpfController,
                    isReadOnly: this.loginController.isLoading == true,
                    textLabel: 'CPF',
                    icon: Icon(
                      Icons.person,
                      color: Colors.red[700],
                      size: 24.0,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
                  color: Colors.white,
                ),
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Observer(
                  builder: (_) {
                    return TextFormField(
                      keyboardType: TextInputType.text,
                      enabled: loginController.enabledEditing,
                      readOnly: this.loginController.isLoading == true,
                      onChanged: this.loginController.setToken,
                      obscureText: !loginController.showPass,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Chave de ativação',
                        suffixIcon: Container(
                          color: Colors.white,
                          width: 50,
                          child: IconButton(
                            onPressed: () => loginController.showPass =
                                !loginController.showPass,
                            icon: Icon(
                              loginController.showPass
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.remove_red_eye,
                              size: 18,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.red[700],
                        ),
                        icon: Icon(
                          Icons.lock_outline,
                          color: Colors.red[700],
                          size: 24.0,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Observer(builder: (_) {
                return criaDropDownButton();
              }),
              SizedBox(
                height: 20.0,
              ),
              Observer(builder: (_) {
                return chackErrorMessenger(
                  this.loginController.isShow,
                ); // Se errorMessage for true ira fornecer o value na tela.
              }),
              SizedBox(
                height: 50.0,
              ),
              Observer(
                builder: (_) {
                  if (this.loginController.isLoading) {
                    return Container(
                      height: 48,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return ButtonConfirmWidget(
                    text: 'ENTRAR',
                    isEnabled: this.loginController.isLoginBottonEnabled,
                    onPressed: () {
                      this.loginController.login(
                        (loginResponseEntity) {
                          loginResponseEntity.data != null
                              ? Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdateAccountScreen(
                                      loginResponseEntity: loginResponseEntity,
                                    ),
                                  ),
                                )
                              : this.loginController.errorMessage.isNotEmpty
                                  ? this.showAlertDialog(
                                      title: 'Algo deu errado.',
                                      subtitle: loginController.errorMessage,
                                    )
                                  : this.loginController.isShow = true;
                        },
                      );
                    },
                  );
                },
              ),
              SizedBox(
                height: 50.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  criaDropDownButton() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 19, left: 15),
            child: Icon(
              Icons.input_rounded,
              color: Colors.red[700],
              size: 22,
            ),
          ),
          DropdownButton<String>(
            items: _cidades.map((String dropDownStringItem) {
              return DropdownMenuItem<String>(
                value: dropDownStringItem,
                child: Container(
                  width: 148,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    dropDownStringItem,
                    style: TextStyle(
                      color: Colors.red[700],
                      fontSize: 18,
                    ),
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              print(
                this.loginController.usersType,
              );
              loginController.setUserType(value);
            },
            value: this.loginController.usersType,
          ),
        ],
      ),
    );
  }

  Widget chackErrorMessenger(bool isShow) {
    if (isShow) {
      return Padding(
        padding: const EdgeInsets.only(left: 24, top: 8),
        child: Column(
          children: [
            Icon(
              Icons.error,
              color: Colors.red[700],
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              this.loginController.loginEntity.errorMessage,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
    }
    return Container();
  }
}
