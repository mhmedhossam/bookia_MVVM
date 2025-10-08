import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/features/auth/data/models/request/auth_data.dart';
import 'package:bookia/features/auth/data/models/response/auth_response/auth_response.dart';
import 'package:bookia/features/auth/data/models/response/forget_password/forget_password.dart';
import 'package:bookia/features/auth/data/repo/auth_endpoints.dart';

class AuthRepo {
  static Future<AuthResponse> register(AuthDataRequesr authDataRequesr) async {
    var data = await DioProvider.post(
      AuthEndpoints.register,
      data: authDataRequesr.toJson(),
    );
    return AuthResponse.fromjson(data);
  }

  static Future<AuthResponse> login(AuthDataRequesr authDataRequesr) async {
    var data = await DioProvider.post(
      AuthEndpoints.login,
      data: authDataRequesr.toJson(),
    );

    return AuthResponse.fromjson(data);
  }

  static Future<ForgetPassword> forgetPassword(
    AuthDataRequesr authDataRequesr,
  ) async {
    var data = await DioProvider.post(
      AuthEndpoints.forgetPassword,
      data: authDataRequesr.toJson(),
    );

    return ForgetPassword.fromJson(data);
  }

  static Future<ForgetPassword> otpVerifyy(
    AuthDataRequesr authDataRequesr,
  ) async {
    var data = await DioProvider.post(
      AuthEndpoints.otpVerify,
      data: authDataRequesr.toJson(),
    );

    return ForgetPassword.fromJson(data);
  }

  static Future<AuthResponse> setNewPassword(
    AuthDataRequesr authDataRequesr,
  ) async {
    var data = await DioProvider.post(
      AuthEndpoints.setNewPassword,
      data: authDataRequesr.toJson(),
    );

    return AuthResponse.fromjson(data);
  }

  static Future<AuthResponse> passwordChanged(String token) async {
    var data = await DioProvider.get(
      AuthEndpoints.passwordChanged,
      headers: {'Authorization': 'Bearer $token'},
    );

    return AuthResponse.fromjson(data);
  }
}
