import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/shared/cubit/bloc.dart';
import 'package:pharmacy/shared/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pharmacy/shared/styles/colors.dart';

class Products extends StatelessWidget {
  Products({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return ConditionalBuilder(
            condition: true,
            builder: (context) {
              return Productbuilder();
            },
            fallback: (context) {
              return Center(child: CircularProgressIndicator());
            });
      },
    );
  }

  List<String> images = ["assets/images/image.png"];
  Widget Productbuilder() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
              items: images.map((banner) {
                return Image(
                  image: AssetImage(images[0]),
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              }).toList(),
              options: CarouselOptions(
                  height: 250,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  viewportFraction: 1)),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildcategoryitem(),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                    itemCount: 5,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'New Products',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.grey[300],
            child: GridView.count(
                mainAxisSpacing: 7,
                crossAxisSpacing: 7,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: .7,
                children: List.generate(5, (index) => buildproduct())),
          )
        ],
      ),
    );
  }
}

Widget buildcategoryitem() => Container(
      width: 100,
      height: 100,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image(
            image: AssetImage('assets/images/image.png'),
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          Container(
              width: double.infinity,
              color: Colors.black.withOpacity(.8),
              child: Text(
                'name',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                maxLines: 1,
              )),
        ],
      ),
    );

Widget buildproduct() {
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage('assets/images/image.png'),
          width: double.infinity,
          height: 200,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Text(
                    '200',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: primary_c),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
