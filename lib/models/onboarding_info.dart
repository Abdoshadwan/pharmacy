class OnBoardingInfo {
  final String title;
  final String descriptions;
  final String image;
  OnBoardingInfo(
      {required this.title, required this.descriptions, required this.image});
}

class OnBoardingItems {
  List<OnBoardingInfo> items = [
    OnBoardingInfo(
        title: 'pharmacy',
        descriptions: 'this pharmacy_app to display products and browse ',
        image: "assets/images/logo3.jpg"),
    OnBoardingInfo(
        title: 'Combinations',
        descriptions:
            'Combinations are the addition that makes this application something special',
        image: "assets/images/onboard2.gif"),
    OnBoardingInfo(
        title: "let's start",
        descriptions: 'you can use this application in easy way',
        image: "assets/images/logo3.jpg"),
  ];
}
