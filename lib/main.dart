import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ne_kidaem_test/bloc/login/bloc.dart';
import 'package:ne_kidaem_test/bloc/task_list/bloc.dart';
import 'package:ne_kidaem_test/domain/network/http_client.dart';
import 'package:ne_kidaem_test/domain/repositories/login.dart';
import 'package:ne_kidaem_test/domain/repositories/tasks.dart';
import 'package:ne_kidaem_test/ui/login/screen.dart';
import 'package:ne_kidaem_test/ui/tasks_list/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final title = 'Kanban';

  @override
  Widget build(BuildContext context) {
    final client = HttpClient();
    final loginRepository = LoginRepository(client);
    final tasksRepository = TaskRepository(client);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (BuildContext context) => LoginBloc(loginRepository),
        ),
        BlocProvider(
          lazy: false,
          create: (BuildContext context) => TaskListBloc(tasksRepository),
        ),
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
