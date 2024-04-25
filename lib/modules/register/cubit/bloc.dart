import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/firebase_options.dart';
import 'package:pharmacy/modules/register/cubit/states.dart';
import 'package:firebase_core/firebase_core.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(registerInitialsState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void Register_user({
    required String name,
    required String phone,
    required String email,
    required var password,
  }) async {
    emit(registerLoadState());
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(registercreateSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(registercreateErrorState(error.toString()));
    });
  }
}
//   void usercreate({
//     required String name,
//     required String phone,
//     required String email,
//     required String uid,
//   }) {
//     UserModel model = UserModel(
//       email: email,
//       name: name,
//       phone: phone,
//       uid: uid,
//       image:
//           'https://img.freepik.com/free-photo/handsome-bearded-guy-posing-against-white-wall_273609-20597.jpg?w=740&t=st=1699875051~exp=1699875651~hmac=9a15061e647d3b0396ace910b9cd77338792ebe6d8fcfa4fde2e33ab1c02365b',
//     );
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(uid)
//         .set(model.toMap())
//         .then((value) {
//       emit(registercreateSuccessState(uid: uid));
//     }).catchError((error) {
//       emit(registercreateErrorState(error));
//     });
//   }
// }
