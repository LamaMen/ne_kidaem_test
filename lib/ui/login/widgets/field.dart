import 'package:flutter/material.dart';

import '../../constants.dart';

class LoginField extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  // final FormFieldValidator<String> validator;
  final bool Function(String? value) validationRule;
  final String errorText;

  const LoginField({
    Key? key,
    this.obscureText = false,
    required this.hintText,
    // required this.validator,
    required this.validationRule,
    required this.errorText,
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
