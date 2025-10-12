class HomeStates {}

class InitialState extends HomeStates {}

class HomeLoading extends HomeStates {}

class HomeSucceed extends HomeStates {}

class HomeFailure extends HomeStates {
  final String message;

  HomeFailure({required this.message});
}
