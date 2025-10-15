class CartStates {}

class CartInitialState extends CartStates {}

class CartSucceedState extends CartStates {}

class CartLoadingState extends CartStates {}

class CartFailureState extends CartStates {
  final String? message;
  CartFailureState({this.message});
}
