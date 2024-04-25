import 'package:flutter/material.dart';
import 'package:pharmacy/modules/login/cubit/bloc.dart';
import 'package:pharmacy/modules/login/cubit/states.dart';
import 'package:pharmacy/modules/register/animation.dart';
import 'package:pharmacy/modules/register/register.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var passwordcontroller = TextEditingController();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Container(
                    child: Column(children: [
                      FadeAnimation(
                        1,
                        Container(
                          height: 400,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/background.png'),
                                  fit: BoxFit.fill)),
                          child: Stack(children: [
                            Container(
                              child: Positioned(
                                left: 30,
                                height: 200,
                                width: 80,
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/light-1.png'))),
                                ),
                              ),
                            ),
                            Positioned(
                                left: 140,
                                height: 150,
                                width: 80,
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/light-2.png'))),
                                )),
                            Positioned(
                              child: Container(
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              textformfield(
                                hinttext: 'Email',
                                prefixicon: Icons.email,
                                controller: emailcontroller,
                                keyboardType: TextInputType.emailAddress,
                                validator: (p0) {
                                  if (p0!.isEmpty) {
                                    return 'please enter email address';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              textformfield(
                                hinttext: 'Password',
                                prefixicon: Icons.password,
                                controller: passwordcontroller,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (p0) {
                                  if (p0!.isEmpty) {
                                    return 'password too short ';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              defaultbutton(
                                text: 'Login',
                                ontap: () {
                                  // if (formkey.currentState!.validate()) {
                                  //   LoginCubit.get(context).userLogin(
                                  //       email: emailcontroller.text,
                                  //       password: passwordcontroller.text);
                                  // }
                                },
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("don't have an account? "),
                                  TextButton(
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                          color: primary_c,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    onPressed: () {
                                      navigate_close(context, Register());
                                    },
                                  ),
                                ],
                              )
                            ]),
                      )
                    ]),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
