import 'package:app_links/app_links.dart';
import 'package:deeplink_project_for_mr_group/bloc/auth/auth_bloc.dart';
import 'package:deeplink_project_for_mr_group/bloc/auth/auth_event.dart';
import 'package:deeplink_project_for_mr_group/bloc/auth/auth_state.dart';
import 'package:deeplink_project_for_mr_group/locator.dart';
import 'package:deeplink_project_for_mr_group/ui/screens/home_screen.dart';
import 'package:deeplink_project_for_mr_group/ui/screens/login_screen.dart';
import 'package:deeplink_project_for_mr_group/ui/screens/register_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final AppLinks _appLinks;
  Uri? deeplinkUri;
  @override
  void initState() {
    _appLinks = AppLinks();

    _initDeepLinks();
    super.initState();
  }

  void _initDeepLinks() async {
    _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        _handleDeepLink(uri);
      }
    });

    final Uri? initialUri = await _appLinks.getInitialLink();
    if (initialUri != null) {
      _handleDeepLink(initialUri);
    }
  }

  void _handleDeepLink(Uri uri) {
    setState(() {
      deeplinkUri = uri;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>()..add(CheckTokenStatus()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.authenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else if (state.status == AuthStatus.unauthenticated) {
            if (deeplinkUri == null) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            } else {
              var deepLinkParams = deeplinkUri!.queryParameters;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => RegisterScreen(
                          referralLink: deepLinkParams['referralId'],
                        )),
              );
            }
          }
        },
        child: Scaffold(
            body: const Center(
                child: Column(
          children: [
            SizedBox(height: 100),
            Icon(
              Icons.link,
              size: 160,
            ),
            Text(
              "Deep Link Demo App",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ))),
      ),
    );
  }
}
