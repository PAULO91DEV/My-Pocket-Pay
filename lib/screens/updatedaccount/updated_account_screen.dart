import 'dart:io';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:my_pocket_pay/domain/entities/login_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_pocket_pay/commons/extensions.dart';
import 'package:my_pocket_pay/screens/activationlocation/activation_location_screen.dart';
import 'package:my_pocket_pay/screens/updatedaccount/updated_account_controller.dart';
import 'package:my_pocket_pay/widgets/bottom_confirm_items.dart';
import 'package:my_pocket_pay/widgets/input_text_widget.dart';

class UpdateAccountScreen extends StatefulWidget {
  final LoginResponseEntity loginResponseEntity;
  UpdateAccountScreen({
    Key key,
    this.loginResponseEntity,
  }) : super(key: key);

  @override
  _UpdateAccountScreenState createState() => _UpdateAccountScreenState();
}

class _UpdateAccountScreenState extends State<UpdateAccountScreen> {
  CurrentAddressController currentAddressController;

  final MaskedTextController cepController =
      MaskedTextController(mask: '00000-000');

  Dio createDio() {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
    ));
    return dio;
  }

  @override
  void initState() {
    super.initState();
    this.currentAddressController = CurrentAddressController(
      this.widget.loginResponseEntity,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Observer(builder: (_) {
        return createBody();
      }),
    );
  }

  Widget createBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 15.0, right: 15.0),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: [
                  SizedBox(
                    height: 64,
                  ),
                  Text(
                    "Olá ${this.widget.loginResponseEntity.data.accntName}, tudo bem?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Icon(
                    Icons.add_location_alt,
                    color: Colors.red[900],
                    size: 54.0,
                  ),
                  Text(
                    "Vamos atualizar o seu endereço ?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InputTextWidget(
                      isReadOnly: true,
                      textLabel: "Endereço : ",
                      initialValue:
                          this.widget.loginResponseEntity.data.address,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    InputTextWidget(
                      isReadOnly: true,
                      textLabel: "Numero : ",
                      initialValue:
                          this.widget.loginResponseEntity.data.addressNumber,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    InputTextWidget(
                      isReadOnly: true,
                      textLabel: "Complemento : ",
                      initialValue: this
                          .widget
                          .loginResponseEntity
                          .data
                          .addressComplement,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    InputTextWidget(
                      isReadOnly: true,
                      textLabel: "Bairro : ",
                      initialValue:
                          this.widget.loginResponseEntity.data.neighborhood,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    InputTextWidget(
                      isReadOnly: true,
                      textLabel: "Cidade : ",
                      initialValue: this.widget.loginResponseEntity.data.city,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    InputTextWidget(
                      isReadOnly: true,
                      textLabel: "Estado : ",
                      initialValue: this.widget.loginResponseEntity.data.state,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    InputTextWidget(
                      isReadOnly: true,
                      textLabel: "País : ",
                      initialValue:
                          this.widget.loginResponseEntity.data.countryProfile,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    InputTextWidget(
                      isReadOnly: true,
                      textLabel: "CEP : ",
                      initialValue:
                          this.widget.loginResponseEntity.data.postalCode,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: ButtonConfirmWidget(
                    text: 'Atualizar',
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActivationLocationScreen(
                                    loginResponseEntity:
                                        this.widget.loginResponseEntity,
                                  )));
                    },
                    isEnabled: true,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: ButtonConfirmWidget(
                    text: 'Está correto',
                    onPressed: () {
                      if (this
                          .widget
                          .loginResponseEntity
                          .data
                          .accntName
                          .isNotEmpty) {
                        this.showAlertDialog(
                            title: 'Obrigado.',
                            subtitle:
                                this.widget.loginResponseEntity.data.accntName);
                        Future.delayed(Duration(seconds: 3)).then((_) {
                          exit(0);
                        });
                      }
                    },
                    isEnabled: true,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
