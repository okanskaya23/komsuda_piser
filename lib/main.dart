import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Pages/login_page.dart';
import 'package:komsuda_piser_local/Pages/signup_page.dart';

import 'Pages/forgot_password_page.dart';
import 'Pages/home_page.dart';
import 'Utils/app_colors.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Appcolors.primary,
        errorColor: Appcolors.third,
      ),
      initialRoute: '/login',
      routes: {

        '/login': (context) => login(),
        '/signup': (context) => signup(),
        '/forgot': (context) => forgot(),
        '/home': (context) => home(),

      },
    ),
  );
  // );
}
