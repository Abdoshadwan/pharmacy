import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/models/usermodel.dart';
// import 'package:pharmacy/firebase_options.dart';
import 'package:pharmacy/modules/register/cubit/states.dart';
// import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(registerInitialsState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  // Future<String> Register_user(
  //     {required String email,
  //     required String password,
  //     required String name,
  //     required String phone}) async {
  //   final url = Uri.parse(
  //       'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBwlUPS7Yv-wNB0gRZ4mHhxao66vl64TZc');

  //   final response = await http.post(
  //     url,
  //     body: json.encode({
  //       'email': email,
  //       'password': password,
  //       'returnSecureToken': true,
  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     // Signup successful
  //     // Extract the token from the response
  //     final Map<String, dynamic> responseData = json.decode(response.body);
  //     usercreate(
  //         email: email,
  //         name: name,
  //         phone: phone,
  //         uid: 'p9fRgUS8YGVxuIG6Bnz2IQPRAsz2');
  //     emit(registercreateSuccessState());
  //     return responseData['idToken'];
  //   } else {
  //     // Signup failed
  //     final Map<String, dynamic> errorData = json.decode(response.body);
  //     emit(registercreateErrorState(errorData.toString()));
  //     print(errorData.toString());
  //     return '';
  //   }
  // }

  void Register_user({
    required String name,
    required String phone,
    required String email,
    required var password,
  }) async {
    emit(registerLoadState());

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      usercreate(name: name, phone: phone, email: email, uid: value.user!.uid);
      emit(registercreateSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(registercreateErrorState(error.toString()));
    });
  }

  void usercreate({
    required String name,
    required String phone,
    required String email,
    required String uid,
  }) {
    UserModel model = UserModel(
      email: email,
      name: name,
      phone: phone,
      uid: uid,
      image:
          'https://img.freepik.com/free-photo/handsome-bearded-guy-posing-against-white-wall_273609-20597.jpg?w=740&t=st=1699875051~exp=1699875651~hmac=9a15061e647d3b0396ace910b9cd77338792ebe6d8fcfa4fde2e33ab1c02365b',
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      emit(registercreateSuccessState());
    }).catchError((error) {
      emit(registercreateErrorState(error));
    });
  }
}
