part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthFailure extends AuthState {
  final String error;

  const AuthFailure(this.error);
  @override
  List<Object> get props => [error];

  @override
  String toString() {
    // TODO: implement toString
    return 'LoginFailure {error: $error}';
  }
}

class UserLoaded extends AuthState {
  final Response model;

  const UserLoaded({required this.model});
  @override
  // TODO: implement props
  List<Object?> get props => [model];
}

class AuthHasToken extends AuthState {
  final String token;

  const AuthHasToken({required this.token});
  @override
  // TODO: implement props
  List<Object?> get props => [token];
}

class AuthAuthenticated extends AuthState {
  final ResponseUser modaluser;

  const AuthAuthenticated({required this.modaluser});
  @override
  // TODO: implement props
  List<Object?> get props => [modaluser];
}

class AuthUnAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}
