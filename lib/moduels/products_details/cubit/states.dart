abstract class DetailsStates {}
class InitialDetailsState extends DetailsStates {}
class DetailsLoadingStates  extends DetailsStates {}
class DetailsSuccessStates  extends DetailsStates {}
class DetailsErrorStates  extends DetailsStates {
  final String error;
  DetailsErrorStates(this.error);
}

