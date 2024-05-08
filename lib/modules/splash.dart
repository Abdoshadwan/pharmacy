import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmacy/shared/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash_Screen extends StatelessWidget {
  const Splash_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            useMaterial3: true,
            appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.dark,
                  statusBarColor: Color_splash),
              color: Color_splash,
            )),
        child: Scaffold(
          body: splash(),
          backgroundColor: Color_splash,
        ));
  }
}

const Color_splash = Colors.white;
Widget splash() {
  return Container(
    color: Color_splash,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: 200,
              height: 200,
              child: SvgPicture.asset(
                Assets.logo,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
