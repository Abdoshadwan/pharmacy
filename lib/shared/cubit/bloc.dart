import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/modules/combination.dart';
import 'package:pharmacy/modules/favorites.dart';
import 'package:pharmacy/modules/products.dart';
import 'package:pharmacy/modules/settings.dart';
import 'package:pharmacy/shared/cubit/states.dart';

class AppCubit extends Cubit<AppCubitStates> {
  AppCubit() : super(InitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  bool islastpage = false;
  void change_onboard(onboardlistlength, index) {
    islastpage = onboardlistlength - 1 == index;
    emit(cgOnBoardingState());
  }

  //navigation bar
  int selectedIndex = 0;

  late PageController pageController =
      PageController(initialPage: selectedIndex);
  void initState() {
    pageController = PageController(initialPage: selectedIndex);
    emit(initbottomnavbar());
  }

  onButtonPressed(int index) {
    selectedIndex = index;
    emit(bottomnavbar());
    pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  //************************************************** */
  List<Widget> listOfWidget = <Widget>[
    Products(),
    Combination(),
    Favorites(),
    Settings(),
  ];
}
