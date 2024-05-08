import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/firebase_options.dart';
import 'package:pharmacy/layout/home.dart';
import 'package:pharmacy/modules/login/login.dart';
import 'package:pharmacy/modules/onboarding.dart';
import 'package:pharmacy/modules/splash.dart';
import 'package:pharmacy/shared/cache/sharedpref.dart';
import 'package:pharmacy/shared/cubit/bloc.dart';
import 'package:pharmacy/shared/cubit/bloc_observer.dart';
import 'package:pharmacy/shared/styles/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = MyBlocObserver();
  final prefs = await SharedPreferences.getInstance();
  var onboarding = prefs.getBool("onboarding") ?? false;
  await Cache_Helper.Init();
  var uid = Cache_Helper.getsaved(key: 'uid') ?? 'null';
  print(uid);

  Widget startpage = uid == 'null' ? Login() : Home();

  runApp(
    BlocProvider(
        create: (context) => AppCubit()
          ..getProducts()
          ..getcombins(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lighttheme,
          darkTheme: darktheme,
          themeMode: ThemeMode.light,
          home: AnimatedSplashScreen(
            backgroundColor: Color_splash,
            duration: 3000,
            splashIconSize: 300,
            splash: Splash_Screen(),
            nextScreen: onboarding == true
                ? startpage
                : On_Boarding(
                    startpage: startpage,
                  ),
          ),
        )),
  );
}
