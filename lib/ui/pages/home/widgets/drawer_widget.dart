import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:school_managment/config/app_colors.dart';
import 'package:school_managment/ui/pages/auth/bloc/auth_bloc.dart';
import 'menu_item.widget.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});


  @override
  Drawer build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Drawer(
      backgroundColor:  Theme.of(context).colorScheme.tertiary,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
           SizedBox(
            height: 220,
            child: DrawerHeader(
                decoration:  BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //image
                    const SizedBox(
                      height: 60,
                      width: 60,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 50,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (context, state) {
                        if(state is AuthenticationAuthenticated) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${state.authResponse.student?.fullName()}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                              Text( "${state.authResponse.student?.classRoom.division ?? '' } - ${state.authResponse.student?.registrationNumber.toUpperCase() ?? ''}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white),
                              )
                            ],
                          );
                        }
                        return Container();
                      },
                    ),

                  ],
                )),
          ),

          MenuItemWidget(
            icon: Icons.person_add,
            title: 'Add Account',
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          MenuItemWidget(
            icon: Icons.ios_share,
            title: 'Switch Account',
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          MenuItemWidget(
            icon: Icons.scoreboard_outlined,
            title: 'Exams',
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          MenuItemWidget(
            icon: Icons.money,
            title: 'Payment History',
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          MenuItemWidget(
            icon: Icons.settings,
            title: 'Settings',
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          MenuItemWidget(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () {
              authBloc.add(LoggedOut());
            },
          ),

        ],
      ),
    );
  }
}
