import 'package:flutter/material.dart';

class ButtonConfirmWidget extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isEnabled;
  const ButtonConfirmWidget({
    Key key,
    this.text,
    this.onPressed,
    this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.0),
                ),
              ),
              onPressed: isEnabledBotton(this.onPressed),
              child: Text(
                this.text,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color:
                      (this.isEnabled == true ? Colors.white : Colors.red[800]),
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Function isEnabledBotton(Function onPressed) {
    if (this.isEnabled) {
      return onPressed;
    }
    return null;
  }
}
