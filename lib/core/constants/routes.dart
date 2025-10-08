import 'package:bookia/features/auth/presentation/cubit/authtcubit.dart';
import 'package:bookia/features/auth/presentation/view/create_new_password.dart';
import 'package:bookia/features/auth/presentation/view/forget_password.dart';
import 'package:bookia/features/auth/presentation/view/login_screen.dart';
import 'package:bookia/features/auth/presentation/view/otp_verify.dart';
import 'package:bookia/features/auth/presentation/view/pass_changed.dart';
import 'package:bookia/features/auth/presentation/view/register_screen.dart';
import 'package:bookia/features/home/presentation/view/home_screen.dart';
import 'package:bookia/features/splash/splash_screen.dart';
import 'package:bookia/features/welcome/welcome_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static String splashScreen = "/splash_screen";
  static String welcomeScreen = "/welcome_screen";
  static String loginScreen = "/login_screen";
  static String registerScreen = "/register_screen";
  static String forgetPasswordScreen = "/forgetPassword_screen";
  static String otpVerifyScreen = "/otp_verify_screen";
  static String createNewPassScreen = "/create_new_pass_screen";
  static String passChangedScreen = "/pass_changed_screen";
  static String homeScreen = "/home_screen";
  static var routes = GoRouter(
    initialLocation: splashScreen,
    routes: [
      GoRoute(path: splashScreen, builder: (context, state) => SplashScreen()),
      GoRoute(path: homeScreen, builder: (context, state) => HomeScreen()),

      GoRoute(
        path: createNewPassScreen,

        builder: (context, state) {
          final otp = state.extra as String;
          return BlocProvider(
            create: (context) => Authtcubit(),
            child: CreateNewPassword(otp: otp),
          );
        },
      ),

      GoRoute(
        path: forgetPasswordScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => Authtcubit(),
          child: ForgetPassword(),
        ),
      ),
      GoRoute(
        path: otpVerifyScreen,

        builder: (context, state) {
          final email = state.extra as String;
          return BlocProvider(
            create: (context) => Authtcubit(),
            child: OtpVerify(email: email),
          );
        },
      ),
      GoRoute(
        path: welcomeScreen,
        builder: (context, state) => WelcomeScreen(),
      ),
      GoRoute(
        path: loginScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => Authtcubit(),
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: registerScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => Authtcubit(),
          child: RegisterScreen(),
        ),
      ),
      GoRoute(
        path: passChangedScreen,
        builder: (context, state) {
          final token = state.extra is String ? state.extra as String : "";

          return BlocProvider(
            create: (context) => Authtcubit(),
            child: PassChanged(token: token),
          );
        },
      ),
    ],
  );
}
