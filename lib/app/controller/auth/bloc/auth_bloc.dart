import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myposh/app/models/auth/request/request_login.dart';
import 'package:myposh/app/models/auth/response/response_auth.dart';

import '../../../repositories/auth/repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiDataSource repository;
  AuthBloc(this.repository) : super(AuthInitial()) {
    on<AppStarted>((event, emit) async {
      final bool hasToken = await repository.hasToken();
      if (hasToken) {
        emit(AuthAuthenticated());
      } else {
        emit(AuthUnAuthenticated());
      }
    });

    on<LoginButtonPressed>((event, emit) async {
      emit(AuthLoading());
      try {
        final login = await repository.signIn(event.request);
        if (login!.meta!.status != 'success') {
          await repository.persisToken(login.data!.accessToken!);
          emit(UserLoaded(login));
        }
      } catch (error) {
        emit(AuthFailure(error.toString()));
      }
    });
    // on<AppStarted>((event, emit) async {
    //   // TODO: implement event handler
    // });
  }
}