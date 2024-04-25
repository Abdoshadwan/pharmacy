abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  late String uid;
  LoginSuccessState({required this.uid});
}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}

class changesuffixstate extends LoginStates {}
