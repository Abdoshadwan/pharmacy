import 'package:flutter/material.dart';
import 'package:pharmacy/main.dart';
import 'package:pharmacy/models/onboarding_info.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class On_Boarding extends StatefulWidget {
  const On_Boarding({super.key});

  @override
  State<On_Boarding> createState() => _On_BoardingState();
}

class _On_BoardingState extends State<On_Boarding> {
  final controller = OnBoardingItems();
  final pagecontroller = PageController();
  bool islastpage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: islastpage
            ? getstarted(context)
            : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                TextButton(
                    onPressed: () {
                      pagecontroller.jumpToPage(controller.items.length - 1);
                    },
                    child: Text(
                      'skip',
                      style: TextStyle(color: primary_c),
                    )),
                SmoothPageIndicator(
                  onDotClicked: (index) => pagecontroller.animateToPage(index,
                      duration: Duration(seconds: 1), curve: Curves.easeIn),
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
          onPageChanged: (index) => setState(() {
            islastpage = controller.items.length - 1 == index;
          }),
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
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
  }
}

Widget getstarted(context) {
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
