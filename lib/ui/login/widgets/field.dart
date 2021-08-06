import 'package:flutter/material.dart';

import '../../constants.dart';

class LoginField extends StatelessWidget {
  final bool obscureText;
  final TextEditingController controller;
  final String hintText;
  final bool Function(String? value) validationRule;
  final String errorText;

  const LoginField({
    Key? key,
    this.obscureText = false,
    required this.hintText,
    required this.validationRule,
    required this.errorText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _loginFieldDecoration = InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        textAlign: TextAlign.center,
        decoration: _loginFieldDecoration,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (validationRule(value)) return errorText;
          return null;
        },
      ),
    );
  }
}
