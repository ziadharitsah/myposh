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
  final ResponseAuth model;

  const UserLoaded({required this.model});
  @override
  // TODO: implement props
  List<Object?> get props => [model];
}

class AuthAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthUnAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}
