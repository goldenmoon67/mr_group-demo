import 'package:deeplink_project_for_mr_group/bloc/auth/auth_bloc.dart';
import 'package:deeplink_project_for_mr_group/bloc/auth/auth_event.dart';
import 'package:deeplink_project_for_mr_group/bloc/auth/auth_state.dart';
import 'package:deeplink_project_for_mr_group/locator.dart';
import 'package:flutter/material.dart';
import 'package:deeplink_project_for_mr_group/ui/widgets/auth/login_form.dart';
import 'package:deeplink_project_for_mr_group/ui/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => getIt<AuthBloc>(),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.status == AuthStatus.authenticated) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
            } else if (state.status == AuthStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? 'An error occurred'),
                ),
              );
            }
          },
          builder: (context, state) {
            return LoginForm(
              isLoading: state.status == AuthStatus.loading,
              onLogin: (email, password) {
                context.read<AuthBloc>().add(
                      LoginRequested(
                        email: email,
                        password: password,
                      ),
                    );
              },
            );
          },
        ),
      ),
    );
  }
}
