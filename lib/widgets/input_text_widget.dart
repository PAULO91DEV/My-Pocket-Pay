import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class InputTextWidget extends StatelessWidget {
  final Function onTextChanged;
  final bool isReadOnly;
  final String textLabel;
  final Widget icon;
  final String initialValue;
  final MaskedTextController controller;

  const InputTextWidget({
    Key key,
    this.onTextChanged,
    this.textLabel,
    this.icon,
    this.isReadOnly = false,
    this.initialValue,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.0),
        color: Colors.white,
      ),
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: TextFormField(
          controller: this.controller,
          keyboardType: TextInputType.number,
          readOnly: isReadOnly,
          initialValue: this.initialValue,
          decoration: InputDecoration(
            labelText: textLabel,
            labelStyle: TextStyle(
              fontSize: 18,
              color: Colors.red[700],
            ),
            icon: icon,
          ),
          onChanged: onTextChanged,
        ),
      ),
    );
  }
}

class InputTextWidgetText extends StatelessWidget {
  final Function onTextChanged;
  final bool isReadOnly;
  final String textLabel;
  final Widget icon;
  final String initialValue;
  final MaskedTextController controller;

  const InputTextWidgetText({
    Key key,
    this.onTextChanged,
    this.textLabel,
    this.icon,
    this.isReadOnly = false,
    this.initialValue,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.0),
        color: Colors.white,
      ),
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: TextFormField(
          controller: this.controller,
          keyboardType: TextInputType.text,
          readOnly: isReadOnly,
          initialValue: this.initialValue,
          decoration: InputDecoration(
            labelText: textLabel,
            labelStyle: TextStyle(
              fontSize: 18,
              color: Colors.red[700],
            ),
            icon: icon,
          ),
          onChanged: onTextChanged,
        ),
      ),
    );
  }
}
