import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ne_kidaem_test/ui/constants.dart';

import 'widgets/button.dart';
import 'widgets/field.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4 * defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LoginField(
                  hintText: 'Enter your username',
                  errorText: 'Minimum is 4 characters',
                  validationRule: (value) => value == null || value.length < 4,
                ),
                LoginField(
                  obscureText: true,
                  hintText: 'Enter your password',
                  errorText: 'Minimum is 8 characters',
                  validationRule: (value) => value == null || value.length < 8,
                ),
                LoginButton(onPressed: _logIn),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _logIn() {
    if (_formKey.currentState!.validate()) {
      // Send to server
    }
  }
}
