import 'dart:io';

import 'package:flutter/material.dart';

import 'package:my_pocket_pay/screens/login/login_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false,
    ),
  );
  HttpOverrides.global = new MyHttpOverrides();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
