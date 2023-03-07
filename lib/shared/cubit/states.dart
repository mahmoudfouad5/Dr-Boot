abstract class AppStates {}

class AppInitialState extends AppStates {}

class pickedImageSuccessfulState extends AppStates {}
class pickedImageRegsterSuccessfulState extends AppStates {}

class isCheckedState extends AppStates {}
class AppSingOutState extends AppStates {}

class CreateDoctorWithLoadingState extends AppStates {}
class ChangeIcon extends AppStates {}


class CreateDoctorWithSuccessState extends AppStates {
  final String? Success;

  CreateDoctorWithSuccessState(this.Success);
}

class CreateDoctorWithErrorState extends AppStates {
  final String? error;

  CreateDoctorWithErrorState(this.error);
}
class GetUserDataSuccessState extends AppStates {}

class GetUserDataErrorState extends AppStates {
  final String? error;

  GetUserDataErrorState(this.error);
}
class GetDataLoadingState extends AppStates {}
class GetDataDoctorWithSuccessState extends AppStates {}
class GetDataDoctorWithErrorState extends AppStates {
  final String? error;

  GetDataDoctorWithErrorState(this.error);
}







