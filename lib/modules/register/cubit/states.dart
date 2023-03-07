abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
     final String? error ;

  RegisterErrorState(this.error);

}

class RegisterChangeSuffixIcon extends RegisterStates {}

class CreateUserSuccessState extends RegisterStates {
  final String?uId ;

  CreateUserSuccessState(this.uId );
}
class ConfirmEmailRegisterSuccessState extends RegisterStates {
  final String?uId ;

  ConfirmEmailRegisterSuccessState(this.uId );
}

 class CreateUserErrorState extends RegisterStates {
  final String? error ;

  CreateUserErrorState(this.error);

}










