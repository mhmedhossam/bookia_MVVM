class Authstates {}

class InitialState extends Authstates {}

class Authloading extends Authstates {}

class AuthSuccessed extends Authstates {
  String? token;

  AuthSuccessed({this.token}) {}
}

class AuthFailure extends Authstates {
  String errorMessage;
  AuthFailure({required this.errorMessage});
}

class OtpSuccees extends Authstates {}
