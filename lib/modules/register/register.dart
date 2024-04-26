import 'package:flutter/material.dart';
import 'package:pharmacy/modules/login/login.dart';
import 'package:pharmacy/modules/register/animation.dart';
import 'package:pharmacy/modules/register/cubit/bloc.dart';
import 'package:pharmacy/modules/register/cubit/states.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

// ignore: must_be_immutable
class Register extends StatelessWidget {
  Register({super.key});
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    var namecontroller = TextEditingController();
    var phonecontroller = TextEditingController();
    var emailcontroller = TextEditingController();
    var passwordcontroller = TextEditingController();
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          // if (state is registercreateSuccessState) {
          //   navigate_close(context, Login());
          // }
          // if (state is registercreateErrorState) {
          //   Fluttertoast.showToast(msg: state.error);
          // }
          // if (state is registercreateSuccessState) {
          //   // Cache_Helper.savedata(key: 'uid', value: state.uid).then((value) {
          //   //   navigate_close(context, Login());
          //   // });
          // }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(),
                child: Column(children: [
                  FadeAnimation(
                    1,
                    Container(
                      height: 200,
                      child: Stack(children: [
                        Positioned(
                            left: 40,
                            width: 80,
                            height: 200,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-1.png'))),
                            )),
                        Positioned(
                            right: 40,
                            width: 80,
                            height: 140,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-2.png'))),
                            )),
                        Container(
                          child: Center(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  color: primary_c,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: formkey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textformfield(
                              hinttext: 'User Name',
                              prefixicon: Icons.person,
                              controller: namecontroller,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'name must not be null';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            textformfield(
                              hinttext: 'Email',
                              prefixicon: Icons.email,
                              controller: emailcontroller,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'email must not be null';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            textformfield(
                              hinttext: 'Password',
                              prefixicon: Icons.password,
                              controller: passwordcontroller,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'password must not be null';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            textformfield(
                              hinttext: 'Phone number',
                              prefixicon: Icons.phone,
                              controller: phonecontroller,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'phone must not be null';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.phone,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            ConditionalBuilder(
                              condition: true,
                              builder: (context) {
                                return defaultbutton(
                                    text: 'Register',
                                    ontap: () {
                                      if (formkey.currentState!.validate()) {
                                        RegisterCubit.get(context)
                                            .Register_user(
                                                name: namecontroller.text,
                                                phone: phonecontroller.text,
                                                email: emailcontroller.text,
                                                password:
                                                    passwordcontroller.text);
                                      }
                                    });
                              },
                              fallback: (context) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('you already have accoung? '),
                                TextButton(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: primary_c,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  onPressed: () {
                                    navigate_close(context, Login());
                                  },
                                ),
                              ],
                            )
                          ]),
                    ),
                  )
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
