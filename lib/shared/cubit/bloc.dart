import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/shared/cubit/states.dart';

class AppCubit extends Cubit<AppCubitStates> {
  AppCubit() : super(InitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  bool islastpage = false;
  void change_onboard(onboardlistlength, index) {
    islastpage = onboardlistlength - 1 == index;
    emit(cgOnBoardingState());
  }
}
