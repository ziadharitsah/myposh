import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myposh/app/models/auth/request/request_login.dart';
import 'package:myposh/app/models/auth/request/request_register.dart';
import 'package:myposh/app/models/auth/response/response_auth.dart';
import 'package:myposh/app/models/auth/response/response_user.dart';
import 'package:myposh/app/repositories/auth/api.dart';

import '../../../repositories/auth/repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiDataSource repository;
  AuthBloc(this.repository) : super(AuthInitial()) {
    on<AppStarted>((event, emit) async {
      final hasToken = await repository.hasToken();
      if (hasToken != null) {
        emit(AuthHasToken(token: hasToken));
        print(hasToken);
      } else {
        emit(AuthUnAuthenticated());
      }
    });

    on<LoginButtonPressed>((event, emit) async {
      emit(AuthLoading());
      // try {
      //   final result = await repository.signIn(event.requestmodel);
      //   if (result.meta!.status != 'failed') {
      //     await repository.persisToken(result.data!.accessToken!);
      //     emit(UserLoaded(model: result));
      //   }
      // } catch (error) {
      //   emit(AuthFailure(error.toString()));
      // }

      try {
        ApiResponse response = await repository.login(event.requestmodel);
        if (response.error == null) {
          final data = response.data as Response;
          await repository.persisToken(data.token);
          print(data.token);
          emit(UserLoaded(model: data));
        } else {
          emit(AuthFailure(response.error.toString()));
        }
      } catch (error) {}
    });
    // on<AppStarted>((event, emit) async {
    //   // TODO: implement event handler
    // });
    on<RegisterButtonPressed>((event, emit) async {
      try {
        ApiResponse response = await repository.register(event.register);
        if (response.error == null) {
          final data = response.data as Response;
          print(data);
          emit(UserLoaded(model: data));
        } else {
          emit(AuthFailure(response.error.toString()));
        }
      } catch (error) {}
    });

    // on<GetDataWithToken>((event, emit) async {
    //   emit(AuthLoading());
    //   ApiResponse user = await repository.user();
    //   final data = user.data as ResponseUser;
    //   print(data.user.name);
    //   emit(AuthAuthenticated(modaluser: data));
    // });

    on<DataLoad>((event, emit) async {
      final hasToken = await repository.hasToken();
      if (hasToken != null) {
        ApiResponse user = await repository.user();
        if (user.error == null) {
          final data = user.data as ResponseUser;
          print(data.user.name);
          emit(AuthAuthenticated(modaluser: data));
        }
      } else {
        emit(AuthUnAuthenticated());
      }
    });
  }
}
