import 'package:flutter/material.dart';
import 'package:pharmacy/models/onboarding_info.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/cubit/bloc.dart';
import 'package:pharmacy/shared/cubit/states.dart';
import 'package:pharmacy/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class On_Boarding extends StatelessWidget {
  On_Boarding({super.key, required this.startpage});
  Widget startpage;
  final controller = OnBoardingItems();
  final pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppCubitStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            bottomSheet: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: AppCubit.get(context).islastpage
                  ? getstarted(context, startpage)
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          TextButton(
                              onPressed: () {
                                pagecontroller
                                    .jumpToPage(controller.items.length - 1);
                              },
                              child: Text(
                                'skip',
                                style: TextStyle(color: primary_c),
                              )),
                          SmoothPageIndicator(
                            onDotClicked: (index) =>
                                pagecontroller.animateToPage(index,
                                    duration: Duration(seconds: 1),
                                    curve: Curves.easeIn),
                            controller: pagecontroller,
                            count: controller.items.length,
                            effect: WormEffect(
                              activeDotColor: primary_c,
                              dotHeight: 12,
                              dotWidth: 12,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                pagecontroller.nextPage(
                                    duration: Duration(milliseconds: 600),
                                    curve: Curves.easeIn);
                              },
                              child: Icon(
                                Icons.arrow_forward,
                                color: primary_c,
                              )),
                        ]),
            ),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: PageView.builder(
                onPageChanged: (index) => {
                  AppCubit.get(context)
                      .change_onboard(controller.items.length, index)
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(controller.items[index].image),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        controller.items[index].title,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        controller.items[index].descriptions,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                        textAlign: TextAlign.center,
                      )
                    ],
                  );
                },
                itemCount: controller.items.length,
                controller: pagecontroller,
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget getstarted(context, startpage) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 15),
    decoration:
        BoxDecoration(color: primary_c, borderRadius: BorderRadius.circular(8)),
    width: MediaQuery.of(context).size.width * .9,
    height: 55,
    child: TextButton(
        onPressed: () async {
          final pres = await SharedPreferences.getInstance();
          pres.setBool("onboarding", true);
          navigate_close(context, startpage);
        },
        child: Text(
          "Get Started",
          style: TextStyle(color: Colors.white),
        )),
  );
}
