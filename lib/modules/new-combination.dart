import 'package:flutter/material.dart';
import 'package:pharmacy/modules/combination.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/cubit/bloc.dart';
import 'package:pharmacy/shared/cubit/states.dart';
import 'package:pharmacy/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class New_Combination extends StatelessWidget {
  New_Combination({super.key});
  var textcontroller = TextEditingController();
  var namecontrller = TextEditingController();
  var pricecontrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {
        if (state is createcombinsuccessState) {
          navigate_close(context, Combination());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Create Combination'),
            actions: [
              TextButton(
                  onPressed: () {
                    if (AppCubit.get(context).combinimage == null) {
                      AppCubit.get(context).createCombination(
                        name: namecontrller.text,
                        price: pricecontrller.text,
                        text: textcontroller.text,
                      );
                    } else {
                      AppCubit.get(context).uploadcombinimage(
                        name: namecontrller.text,
                        price: pricecontrller.text,
                        text: textcontroller.text,
                      );
                    }
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 20, color: primary_c),
                  )),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              if (state is createcombinloadingState) LinearProgressIndicator(),
              SizedBox(
                height: 10,
              ),
              textformfield(
                controller: namecontrller,
                hinttext: 'name',
                keyboardType: TextInputType.text,
                prefixicon: Icons.info,
                validator: (p0) {
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              textformfield(
                controller: pricecontrller,
                hinttext: 'price',
                keyboardType: TextInputType.text,
                prefixicon: Icons.price_check,
                validator: (p0) {
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: TextFormField(
                  controller: textcontroller,
                  decoration: InputDecoration(
                      hintText: 'write description of combination',
                      border: InputBorder.none),
                ),
              ),
              if (AppCubit.get(context).combinimage != null)
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4)),
                        // image: DecorationImage(
                        //     image:
                        //     FileImage(),
                        //     fit: BoxFit.cover),
                      ),
                    ),
                    IconButton.outlined(
                        color: primary_c,
                        onPressed: () {
                          AppCubit.get(context).removecombinimage();
                        },
                        icon: Icon(
                          Icons.close,
                        ))
                  ],
                ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                        onPressed: () {
                          AppCubit.get(context).getpickedimage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image),
                            SizedBox(
                              width: 5,
                            ),
                            Text('add photo')
                          ],
                        )),
                  ),
                ],
              )
            ]),
          ),
        );
      },
    );
  }
}
