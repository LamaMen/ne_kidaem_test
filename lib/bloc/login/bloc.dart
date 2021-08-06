import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ne_kidaem_test/bloc/login/events.dart';
import 'package:ne_kidaem_test/bloc/login/states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is OnDataEntered) {
      emit(LoginLoad());
      // send request for auth and validate
      await Future.delayed(Duration(seconds: 1));
      emit(LoginCorrect('${event.username} ${event.password}'));
      reset();
    }
  }

  Future<void> reset() async {
    await Future.delayed(Duration(milliseconds: 100));
    emit(LoginInitial());
  }
}
