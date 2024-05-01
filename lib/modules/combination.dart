import 'package:flutter/material.dart';
import 'package:pharmacy/shared/cubit/bloc.dart';
import 'package:pharmacy/shared/cubit/states.dart';
import 'package:pharmacy/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Combination extends StatelessWidget {
  const Combination({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(border: Border.all(width: .1)),
                padding: EdgeInsets.all(20),
                child: buildproduct()),
            itemCount: 7,
          ),
        );
      },
    );
  }
}

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
