import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../adopt_pet.dart';

class LoginPage extends StatelessWidget {
  final String? redirectRoute;

  const LoginPage({super.key, this.redirectRoute});

  static const String routeName = "login";
  static const String routePath = "/$routeName";

  static String createRoute({String? redirectRoute}) {
    return "$routePath?${redirectRoute == null ? '' : 'redirectRoute=$redirectRoute'}";
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              if (redirectRoute != null) {
                context.go(redirectRoute!);
              } else {
                context.go('/'); // IndexPage ဆီသွားမယ်
              }
            },
            error: (msg) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(msg), backgroundColor: Colors.red),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => const CircularProgressIndicator(),
                    orElse: () => ElevatedButton(
                      onPressed: () => context.read<LoginCubit>().login(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      ),
                      child: const Text('Login'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
