class Authstates {}

class InitialState extends Authstates {}

class Authloading extends Authstates {}

class AuthSuccessed extends Authstates {
  String? token;

  AuthSuccessed({this.token}) {
    print("token 2  $token");
  }
}

class AuthFailure extends Authstates {
  String errorMessage;
  AuthFailure({required this.errorMessage});
}

class OtpSuccees extends Authstates {}
