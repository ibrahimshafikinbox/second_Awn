abstract class AwnSupportStates {}

class AwnSupportInitialState extends AwnSupportStates {}

class AwnSupportLoadingState extends AwnSupportStates {}

class AwnSupportSuccesState extends AwnSupportStates {}

class AwnSupportErrorState extends AwnSupportStates {
  final String error;

  AwnSupportErrorState(this.error);
}
