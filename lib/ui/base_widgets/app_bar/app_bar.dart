import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/app_colors.dart';
import '../../pages/auth/bloc/auth_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const CustomAppBar({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: AppColors.PRIMARY,
      leadingWidth: double.infinity,
      leading: Builder(builder: (context) {
        return Container(
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child:  Center(
                  child: Image.asset(
                      "assets/icons/left-align.png",
                      height: 32,
                      width: 32,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  if (state is AuthenticationAuthenticated){
                    return Text("${state.authResponse.student?.fullName()}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white));
                  }
                  return const Text(
                    'Student',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  );
                },

              )
            ],
          ),
        );
      }),
      actions: [
        IconButton(
          icon: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.black.withOpacity(0.1),
            child: const Icon(Icons.search, color: Colors.white),
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.black.withOpacity(0.1),
            child: const Icon(Icons.notifications, color: Colors.white),
          ),
          onPressed: () {},
        ),
      ],

    );
  }
}
