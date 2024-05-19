import 'package:flutter/material.dart';
import 'package:pharmacy/modules/login/login.dart';
import 'package:pharmacy/shared/cache/sharedpref.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/cubit/bloc.dart';
import 'package:pharmacy/shared/cubit/states.dart';
import 'package:pharmacy/shared/styles/colors.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            drawer: Drawer(),
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Pharmacy',
                style: TextStyle(color: primary_c, fontFamily: 'Oswald'),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Cache_Helper.removesaved(key: 'uid');
                      navigate_close(context, Login());
                    },
                    icon: Icon(
                      Icons.logout,
                      color: primary_c,
                    )),
              ],
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: AppCubit.get(context).pageController,
                    children: AppCubit.get(context).listOfWidget,
                  ),
                ),
              ],
            ),
            bottomNavigationBar: SlidingClippedNavBar.colorful(
              backgroundColor: Colors.white,
              onButtonPressed: (index) {
                // if (index == 1) AppCubit.get(context).getcombins();
                AppCubit.get(context).onButtonPressed(index);
              },
              iconSize: 25,
              selectedIndex: AppCubit.get(context).selectedIndex,
              barItems: <BarItem>[
                BarItem(
                  icon: Icons.home,
                  title: 'HOME',
                  activeColor: primary_c,
                  inactiveColor: primary_c,
                ),
                BarItem(
                  icon: Icons.category,
                  title: 'Combination',
                  activeColor: primary_c,
                  inactiveColor: primary_c,
                ),
                BarItem(
                  icon: Icons.favorite,
                  title: 'Favorites',
                  activeColor: primary_c,
                  inactiveColor: primary_c,
                ),
                BarItem(
                  icon: Icons.tune_rounded,
                  title: 'Settings',
                  activeColor: primary_c,
                  inactiveColor: primary_c,
                ),
              ],
            ));
      },
    );
  }
}
