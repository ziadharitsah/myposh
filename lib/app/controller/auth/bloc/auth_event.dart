part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AppStarted extends AuthEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DataLoad extends AuthEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoggedIn extends AuthEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetDataWithToken extends AuthEvent {
  final String token;

  const GetDataWithToken({required this.token});
  @override
  // TODO: implement props
  List<Object?> get props => [token];
}

class LoggedOut extends AuthEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginButtonPressed extends AuthEvent {
  final RequestLogin requestmodel;

  const LoginButtonPressed({required this.requestmodel});
  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  String toString() {
    // TODO: implement toString
    return 'LoginButtonPressed {$requestmodel}';
  }
}

class RegisterButtonPressed extends AuthEvent {
  final RequestRegister register;

  const RegisterButtonPressed({required this.register});
  @override
  // TODO: implement props
  List<Object?> get props => [register];
}
