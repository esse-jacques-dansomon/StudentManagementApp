import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_managment/config/app_colors.dart';
import 'package:school_managment/ui/pages/auth/signin/bloc/login_bloc.dart';

import '../../home/home_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController(text: "esse@example.com");
    final passwordController = TextEditingController(text: "password");


    void sigIn() {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        loginBloc.add(
          LoginButtonPressed(
            username: emailController.text,
            password: passwordController.text,
          ),
        );

      }
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              alignment: Alignment.center,
              child: const Center(
                child: Image(
                  image: AssetImage("assets/images/new_login.png"),
                ),
              ),
            ),
            const Text("Log In", style: TextStyle(fontSize: 30)),
            const SizedBox(
              height: 40,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        suffixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          suffixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child:
                      BlocConsumer<LoginBloc, LoginState>(
                        builder: (context, state) {
                          if (state is LoginInitial) {
                            return ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  sigIn();
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.PRIMARY),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(15)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              child: const Text("Login",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white)),
                            );

                          }
                          else if (state is LoginFailure) {
                            return ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  sigIn();
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.PRIMARY),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(15)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              child: const Text("Retry Login",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white)),
                            );
                          } else if(state is LoginLoading) {
                            return ElevatedButton(
                              onPressed: () {

                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.PRIMARY),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(15)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              child: const Text("Loading",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white)),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        }, listener: (BuildContext context, LoginState state) {
                          if (state is LoginFailure) {
                            ScaffoldMessenger.of(context)
                               .showSnackBar(SnackBar(content: Text(state.error)));
                          }else if (state is LoginSuccess) {
                            ScaffoldMessenger.of(context)
                               .showSnackBar(const SnackBar(content: Text("Successfully logged in")));

                             // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
                             
                          }

                      },
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
