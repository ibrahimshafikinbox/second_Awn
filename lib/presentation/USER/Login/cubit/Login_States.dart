import 'package:flutter_application_2/presentation/USER/Login/models/Login_model.dart';

abstract class LoginStates {
  get loginModel => null;
}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccesState extends LoginStates {
  late final AwnLoginModel loginModel;
}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState(this.error);
}

class ChangePasswordVisibilityState extends LoginStates {}

class LoginLoadingUserDataState extends LoginStates {}

class LoginSuccessUserDataState extends LoginStates {
  LoginSuccessUserDataState(AwnLoginModel awnLoginModel);
}

class LoginErrorUserDataState extends LoginStates {}
