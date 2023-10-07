import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myposh/app/repositories/auth/repo.dart';
import 'package:myposh/resources/view/auth/pages.dart';
import 'package:myposh/resources/view/dashboard/main_screen.dart';

import 'app/controller/auth/bloc/auth_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            ApiDataSource(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is AuthInitial) {
            context.read<AuthBloc>().add(AppStarted());
            return Container(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is AuthAuthenticated || state is Local) {
            return const Home();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
