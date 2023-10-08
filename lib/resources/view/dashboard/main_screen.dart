import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myposh/app/controller/auth/bloc/auth_bloc.dart';
import 'package:myposh/app/models/auth/response/response_user.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ResponseUser user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    child: Image.network(state.modaluser.user.profilePhotoUrl),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    state.modaluser.user.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    state.modaluser.user.email,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
