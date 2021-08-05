import 'package:flutter/material.dart';

import '../../constants.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _buttonStyle = ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2 * defaultPadding),
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: _buttonStyle,
        child: Text(
          'Log In',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}