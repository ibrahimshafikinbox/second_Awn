abstract class ResetPasswordStates {}

class ResetPasswordInitialState extends ResetPasswordStates {}

class ResetPasswordLoadingState extends ResetPasswordStates {}

class ResetPasswordSuccessState extends ResetPasswordStates {
  get passwordModel => null;
}

class ResetPasswordErrorState extends ResetPasswordStates {
  final String error;

  ResetPasswordErrorState(this.error);
}
