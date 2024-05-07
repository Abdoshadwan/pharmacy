import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/models/productmodel.dart';
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
              return Productbuilder(context);
            },
            fallback: (context) {
              return Center(child: CircularProgressIndicator());
            });
      },
    );
  }

  List<String> images = ['https://img.freepik.com/free-photo/two-miniature-shopping-carts-filled-with-pills-blister-white-background_23-2147883780.jpg?t=st=1715093583~exp=1715097183~hmac=4a6e2003f70391526243fbdb4ba8f8d98c5554859e33a26bf5bd9ee6eb0d6fa8&w=740',
  'https://img.freepik.com/free-photo/front-view-shopping-cart-with-pill-foils-containers_23-2148533497.jpg?t=st=1715091217~exp=1715094817~hmac=654b951c76fc19a06273ad190aed10c6f5e60534db0b00e60621ba72de2a3f52&w=740',
  'https://img.freepik.com/free-photo/top-view-pillboxes-with-stethoscope-table_23-2148430056.jpg?t=st=1715096755~exp=1715100355~hmac=ff3f0e11b45023161bc5b7e449c58ba0d368ead1083cee8aabb2c4eafa11a575&w=740'
  ];
  Widget Productbuilder(context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
              items: images.map((images) {
                return Image(
                  image: NetworkImage('${images}'),
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
                children: List.generate(AppCubit.get(context).Prooducts.length, (index) => buildproduct(AppCubit.get(context).Prooducts[index]))),
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
            image: NetworkImage('https://img.freepik.com/free-photo/front-view-shopping-cart-with-pill-foils-containers_23-2148533497.jpg?t=st=1715091217~exp=1715094817~hmac=654b951c76fc19a06273ad190aed10c6f5e60534db0b00e60621ba72de2a3f52&w=740'),
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

Widget buildproduct(ProductsModel model) {
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: NetworkImage(model.image),
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
                '${model.name}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Text(
                    '${model.price}',
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
