import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myposh/app/controller/auth/bloc/auth_bloc.dart';
import 'package:myposh/app/models/auth/response/response_user.dart';
import 'package:show_network_image/show_network_image.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

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
            context.read<AuthBloc>().add(DataLoad());
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 180,
                    height: 180,
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/photo_border.png'))),
                    child: CachedNetworkImage(
                      imageUrl: state.modaluser.user.profilePhotoUrl,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(state.modaluser.user.profilePhotoUrl.toString()),
                        //whatever image you can put here
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    state.modaluser.user.profilePhotoUrl,
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    state.modaluser.user.name,
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    state.modaluser.user.email,
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
