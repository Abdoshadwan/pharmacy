import 'package:flutter/material.dart';
import 'package:pharmacy/models/combinationmodel.dart';
import 'package:pharmacy/modules/new-combination.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/cubit/bloc.dart';
import 'package:pharmacy/shared/cubit/states.dart';
import 'package:pharmacy/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class Combination extends StatelessWidget {
  const Combination({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                navigate_to(context, New_Combination());
              },
              child: Icon(Icons.add),
            ),
            body: ConditionalBuilder(
              condition: state is getCombinsuccessState ||
                  AppCubit.get(context).combins.length >= 1,
              builder: (context) {
                return AppCubit.get(context).combins.length >= 1
                    ? ListView.builder(
                        itemBuilder: (context, index) => Container(
                            decoration:
                                BoxDecoration(border: Border.all(width: .1)),
                            padding: EdgeInsets.all(20),
                            child: buildproduct(
                                AppCubit.get(context).combins[index])),
                        itemCount: AppCubit.get(context).combins.length,
                      )
                    : Center(child: CircularProgressIndicator());
              },
              fallback: (context) {
                return Center(child: Text('Empty'));
              },
            ));
      },
    );
  }
}

Widget buildproduct(CombinModel model) {
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: NetworkImage('${model.image}'),
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
