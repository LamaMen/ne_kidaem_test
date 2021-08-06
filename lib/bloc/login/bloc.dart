import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ne_kidaem_test/bloc/login/events.dart';
import 'package:ne_kidaem_test/bloc/login/states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is DataEntered) {
      emit(LoginLoad());
      await Future.delayed(
          Duration(seconds: 1)); // send request for auth and validate
      emit(LoginSuccess('${event.username} ${event.password}'));
      reset();
    }
  }

  Future<void> reset() async {
    await Future.delayed(Duration(milliseconds: 100));
    emit(LoginInitial());
  }
}
