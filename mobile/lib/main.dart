import 'package:deeplink_project_for_mr_group/data/firebase/firebase_options.dart';
import 'package:deeplink_project_for_mr_group/ui/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:deeplink_project_for_mr_group/locator.dart';
import 'package:deeplink_project_for_mr_group/theme/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      title: 'Deeplink Demo',
      home: const SplashScreen(),
    );
  }
}
