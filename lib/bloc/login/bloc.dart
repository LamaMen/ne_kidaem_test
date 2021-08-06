import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ne_kidaem_test/bloc/login/events.dart';
import 'package:ne_kidaem_test/bloc/login/states.dart';
import 'package:ne_kidaem_test/domain/exceptions/user.dart';
import 'package:ne_kidaem_test/domain/repositories/login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _repository;

  LoginBloc(this._repository) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is DataEntered) {
      emit(LoginLoad());
      try {
        final answer = await _repository.login(event.username, event.password);
        emit(LoginSuccess(answer));
        reset();
      } on UserUnauthorizedException {
        emit(LoginFailure.auth());
      } catch (e) {
        emit(LoginFailure.internet());
      }
    }
  }

  Future<void> reset() async {
    await Future.delayed(Duration(milliseconds: 100));
    emit(LoginInitial());
  }
}
