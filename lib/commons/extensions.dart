import 'package:flutter/material.dart';

extension CreatePopup on State<StatefulWidget> {
  Future showAlertDialog({
    @required String title,
    @required String subtitle,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding:
              const EdgeInsets.only(top: 140, bottom: 170, right: 20, left: 20),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            title: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Center(
                child: Text(
                  title,
                ),
              ),
            ),
            content: Column(
              children: [
                Text(
                  subtitle,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
