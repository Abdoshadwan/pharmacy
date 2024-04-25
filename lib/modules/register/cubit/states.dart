abstract class RegisterStates {}

class registerInitialsState extends RegisterStates {}

class registerLoadState extends RegisterStates {}

class registercreateSuccessState extends RegisterStates {
  // late String uid;
  // registercreateSuccessState({required this.uid});
}

class registercreateErrorState extends RegisterStates {
  String error;
  registercreateErrorState(this.error);
}
