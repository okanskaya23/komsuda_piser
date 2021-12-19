import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:komsuda_piser_local/Pages/Authentication/login_page.dart';
import 'package:komsuda_piser_local/Pages/Authentication/signup_page.dart';
import 'package:komsuda_piser_local/Navigator/navigator.dart';

import 'Pages/Authentication/forgot_password_page.dart';
import 'Pages/Home/home_page.dart';
import 'Pages/Profile/profile_page.dart';
import 'Utils/app_colors.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Appcolors.primary,
        errorColor: Appcolors.third,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => login(),
        '/signup': (context) => signup(),
        '/forgot': (context) => forgot(),
        '/profile': (context) => ProfilePage(),
        '/': (context) => navigatorPage(),
      },
    ),
  );
  // );
}
