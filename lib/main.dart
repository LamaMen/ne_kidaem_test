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
        return SlideRightRoute(page: LoginPage(title));
      case TasksListPage.route:
        return SlideRightRoute(page: TasksListPage(title));
    }
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;

  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              page,
          transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) =>
              SlideTransition(
            position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                .animate(animation),
            child: child,
          ),
        );
}
