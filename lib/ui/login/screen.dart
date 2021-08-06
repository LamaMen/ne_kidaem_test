import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ne_kidaem_test/bloc/login/bloc.dart';
import 'package:ne_kidaem_test/bloc/login/events.dart';
import 'package:ne_kidaem_test/bloc/login/states.dart';
import 'package:ne_kidaem_test/ui/constants.dart';
import 'package:ne_kidaem_test/ui/tasks_list/screen.dart';

import 'widgets/button.dart';
import 'widgets/field.dart';

class LoginPage extends StatefulWidget {
  static const route = 'login';

  LoginPage(this.title, {Key? key}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4 * defaultPadding),
            child: BlocConsumer<LoginBloc, LoginState>(
              listenWhen: (previous, current) {
                return current is LoginCorrect || current is LoginWrongData;
              },
              listener: _stateListener,
              buildWhen: (previous, current) => !(current is LoginCorrect),
              builder: _body,
            ),
          ),
        ),
      ),
    );
  }

  Widget _body(BuildContext context, LoginState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LoginField(
          controller: _usernameController,
          hintText: 'Enter your username',
          errorText: 'Minimum is 4 characters',
          validationRule: (value) => value == null || value.length < 4,
        ),
        LoginField(
          obscureText: true,
          controller: _passwordController,
          hintText: 'Enter your password',
          errorText: 'Minimum is 8 characters',
          validationRule: (value) => value == null || value.length < 8,
        ),
        LoginButton(
          onPressed: () => _logIn(context),
          isLoad: state is LoginLoad,
        ),
        if (state is LoginWrongData)
          Text('Invalid user data', style: TextStyle(color: Colors.red[400]))
      ],
    );
  }

  void _logIn(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final bloc = BlocProvider.of<LoginBloc>(context);
      final username = _usernameController.text;
      final password = _passwordController.text;
      bloc.add(OnDataEntered(username: username, password: password));
    }
    FocusScope.of(context).unfocus();
  }

  void _stateListener(BuildContext context, LoginState state) {
    if (state is LoginCorrect) {
      _navigate(context, state.token);
    }
    if (state is LoginWrongData) {
      _passwordController.clear();
    }
  }

  void _navigate(BuildContext context, String token) {
    Navigator.of(context).pushNamed(
      TasksListPage.route,
      arguments: token,
    );
    _usernameController.clear();
    _passwordController.clear();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
