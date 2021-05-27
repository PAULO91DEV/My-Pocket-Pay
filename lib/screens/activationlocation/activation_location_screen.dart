import 'dart:io';

import 'package:my_pocket_pay/data/datasources/updatedLocation/remote/updated_account_remote_data.dart';
import 'package:my_pocket_pay/data/repositories/updated_location_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_pocket_pay/domain/entities/login_entity.dart';
import 'package:my_pocket_pay/screens/activationlocation/activation_location_controller.dart';
import 'package:my_pocket_pay/widgets/bottom_confirm_items.dart';
import 'package:my_pocket_pay/widgets/input_text_widget.dart';
import 'package:my_pocket_pay/commons/extensions.dart';

class ActivationLocationScreen extends StatefulWidget {
  final LoginResponseEntity loginResponseEntity;

  ActivationLocationScreen({
    Key key,
    this.loginResponseEntity,
  }) : super(key: key);

  @override
  _ActivationLocationScreenState createState() =>
      _ActivationLocationScreenState();
}

Dio createDio() {
  Dio dio = Dio();
  dio.interceptors.add(LogInterceptor(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
  ));
  return dio;
}

class _ActivationLocationScreenState extends State<ActivationLocationScreen> {
  ActivationLocationController controller;
  final MaskedTextController cepController =
      MaskedTextController(mask: '00000-000');
  //
  final MaskedTextController stateController = MaskedTextController(mask: 'AA');

  @override
  void initState() {
    this.controller = ActivationLocationController(
      this.widget.loginResponseEntity,
      UpdateAccountRepositoryImpl(UpdatedAccountDataSource(createDio())),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 46, left: 22, right: 22),
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 16.0, top: 18),
              child: Text(
                'Ola ${this.widget.loginResponseEntity.data.accntName}! Vamos lá.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            Observer(
              builder: (_) {
                return errorMessenger(this.controller.isShow);
              },
            ),
            Observer(builder: (_) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InputTextWidgetText(
                          onTextChanged: (value) {
                            this.controller.setAddress(value);
                          },
                          isReadOnly: this.controller.isLoading,
                          textLabel: 'Endereço *',
                          icon: null,
                        ),
                        InputTextWidget(
                          onTextChanged: (value) {
                            this.controller.setAddressNumber(value);
                          },
                          isReadOnly: this.controller.isLoading,
                          textLabel: 'Numero *',
                          icon: null,
                        ),
                        InputTextWidgetText(
                          onTextChanged: (value) {
                            this.controller.setAddressComplement(value);
                          },
                          isReadOnly: this.controller.isLoading,
                          textLabel: 'Complemento',
                          icon: null,
                        ),
                        InputTextWidgetText(
                          onTextChanged: (value) {
                            this.controller.setNeighborhood(value);
                          },
                          isReadOnly: this.controller.isLoading,
                          textLabel: 'Bairro *',
                          icon: null,
                        ),
                        InputTextWidgetText(
                          onTextChanged: (value) {
                            this.controller.setCity(value);
                          },
                          isReadOnly: this.controller.isLoading,
                          textLabel: 'Cidade *',
                          icon: null,
                        ),
                        Container(
                          //  height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.0),
                            color: Colors.white,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 22),
                            child: TextFormField(
                              maxLength: 2,
                              controller: stateController,
                              keyboardType: TextInputType.text,
                              readOnly: this.controller.isLoading,
                              decoration: InputDecoration(
                                labelText: 'Estado *',
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red[700],
                                ),
                              ),
                              onChanged: (value) {
                                this.controller.setState(value);
                              },
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.0),
                            color: Colors.white,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            readOnly: this.controller.isLoading,
                            //   initialValue: this.initialValue,
                            decoration: InputDecoration(
                              labelText: 'País *',
                              labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.red[700],
                              ),
                            ),
                            onChanged: (value) {
                              this.controller.setCountry(value);
                            },
                          ),
                        ),
                        InputTextWidget(
                          controller: cepController,
                          onTextChanged: (value) {
                            this.controller.setPostalCode(value);
                          },
                          isReadOnly: this.controller.isLoading,
                          textLabel: 'CEP *',
                          icon: null,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            Observer(
              builder: (_) {
                if (this.controller.isLoading) {
                  FocusScope.of(context).unfocus();
                  return Container(
                    height: 48,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                return Row(
                  children: [
                    Expanded(
                      child: ButtonConfirmWidget(
                        isEnabled: this.controller.isEnabledButton,
                        text: 'Confirmar',
                        onPressed: () {
                          this.controller.updatedAccountClicked((result) {
                            if (result.errors == true) {
                              this.controller.isShow = true;
                            } else {
                              if (this.controller.errorMessage.isNotEmpty) {
                                this.showAlertDialog(
                                    title:
                                        'Algo deu errado, informe o Suporte.',
                                    subtitle: this.controller.errorMessage);
                              } else {
                                this.showAlertDialog(
                                    title: 'Obrigado.',
                                    subtitle: result.errorMessage);
                                Future.delayed(Duration(seconds: 3)).then((_) {
                                  exit(0);
                                });
                              }
                            }
                          });
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }

  Widget errorMessenger(bool isShow) {
    if (isShow) {
      return Padding(
        padding: const EdgeInsets.only(left: 24, top: 8),
        child: Column(
          children: [
            Icon(
              Icons.error,
              color: Colors.redAccent,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              this.controller.errorMessage,
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
