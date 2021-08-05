import 'package:flutter/material.dart';
import 'package:ne_kidaem_test/ui/login/screen.dart';
import 'package:ne_kidaem_test/ui/tasks_list/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final title = 'Kanban';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData.dark(),
      onGenerateRoute: _getRoute,
      initialRoute: LoginPage.route,
    );
  }

  Route? _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.route:
        return RouteBuilder(
          widget: LoginPage(title: title),
          settings: settings,
        );
      case TasksListPage.route:
        return RouteBuilder(
          widget: TasksListPage(title: title),
          settings: settings,
        );
    }
  }
}

class RouteBuilder extends PageRouteBuilder {
  RouteBuilder({required Widget widget, required RouteSettings settings})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          settings: settings,
        );
}
