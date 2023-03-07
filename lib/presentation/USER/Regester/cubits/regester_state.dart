import 'package:flutter_application_2/presentation/USER/Login/models/regester_model.dart';

abstract class RegesterStates {}

class RegesterInitialState extends RegesterStates {}

class RegesterLoadingState extends RegesterStates {}

class RegesterSuccesState extends RegesterStates {
  AwnRegesterModel? regesterModel;
}

class RegesterErrorState extends RegesterStates {
  final String error;

  RegesterErrorState(this.error);
}

//==================================================================//
class ChangePasswordVisibilityState extends RegesterStates {}

class LoginLoadingUserDataState extends RegesterStates {}

class LoginSuccessUserDataState extends RegesterStates {}
