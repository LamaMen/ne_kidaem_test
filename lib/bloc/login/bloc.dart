import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ne_kidaem_test/bloc/login/events.dart';
import 'package:ne_kidaem_test/bloc/login/states.dart';
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
      } catch (e) {
        emit(LoginFailure());
      }
    }
  }

  Future<void> reset() async {
    await Future.delayed(Duration(milliseconds: 100));
    emit(LoginInitial());
  }
}
