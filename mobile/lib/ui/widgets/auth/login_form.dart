import 'package:deeplink_project_for_mr_group/ui/screens/register_screen.dart';
import 'package:deeplink_project_for_mr_group/ui/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final void Function(String email, String password) onLogin;
  final bool isLoading;
  const LoginForm({super.key, required this.onLogin, required this.isLoading});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _emailError;
  String? _passwordError;

  void _submit() {
    setState(() {
      _emailError = null;
      _passwordError = null;
    });

    if (_formKey.currentState?.validate() ?? false) {
      widget.onLogin(_emailController.text, _passwordController.text);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final textTheme = theme.textTheme;

    return AbsorbPointer(
      absorbing: widget.isLoading,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 50),
              Text(
                'Welcome Back',
                style: textTheme.headlineMedium?.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in to continue',
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 50),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email, color: primaryColor),
                  errorText: _emailError,
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email.';
                  } else if (!RegExp(
                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                      .hasMatch(value)) {
                    return 'Please enter a valid email address.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock, color: primaryColor),
                  errorText: _passwordError,
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password.';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  isLoading: widget.isLoading,
                  submit: _submit,
                  text: "Sign In",
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Don\'t have an account? Sign up',
                    style: textTheme.bodyMedium?.copyWith(color: primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
