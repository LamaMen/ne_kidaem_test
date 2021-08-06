import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ne_kidaem_test/ui/login/screen.dart';
import 'package:ne_kidaem_test/ui/tasks_list/screen.dart';

import 'bloc/login/bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final title = 'Kanban';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => LoginBloc()),
      ],
      child: MaterialApp(
        title: title,
        theme: ThemeData.dark(),
        onGenerateRoute: _getRoute,
        initialRoute: LoginPage.route,
      ),
    );
  }

  Route? _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.route:
        return _routeBuilder(page: LoginPage(title));
      case TasksListPage.route:
        final token = settings.arguments as String;
        return _routeBuilder(page: TasksListPage(title, token: token));
    }
  }

  Route _routeBuilder({required Widget page}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          child: child,
          position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
              .animate(animation),
        );
      },
    );
  }
}
