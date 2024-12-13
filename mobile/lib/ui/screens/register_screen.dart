import 'package:deeplink_project_for_mr_group/bloc/auth/auth_event.dart';
import 'package:deeplink_project_for_mr_group/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deeplink_project_for_mr_group/bloc/auth/auth_bloc.dart';
import 'package:deeplink_project_for_mr_group/bloc/auth/auth_state.dart';
import 'package:deeplink_project_for_mr_group/ui/screens/login_screen.dart';
import 'package:deeplink_project_for_mr_group/ui/widgets/auth/register_form.dart';

class RegisterScreen extends StatelessWidget {
  final String? referralLink;
  const RegisterScreen({super.key, this.referralLink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: BlocProvider(
        create: (context) => getIt<AuthBloc>(),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.status == AuthStatus.authenticated) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
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
            return RegisterForm(
              isLoading: state.status == AuthStatus.loading,
              onRegister: (name, email, password) {
                context.read<AuthBloc>().add(
                      RegisterRequested(
                        referralLink,
                        name: name,
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
