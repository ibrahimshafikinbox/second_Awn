abstract class ContactStates {}

class ContactInitialState extends ContactStates {}

class ContactLoadingState extends ContactStates {}

class ContactSuccessState extends ContactStates {}

class ContactErrorState extends ContactStates {
  final String error;

  ContactErrorState(this.error);
}
