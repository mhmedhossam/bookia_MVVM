import 'package:bookia/features/auth/presentation/cubit/authtcubit.dart';
import 'package:bookia/features/auth/presentation/view/create_new_password.dart';
import 'package:bookia/features/auth/presentation/view/forget_password.dart';
import 'package:bookia/features/auth/presentation/view/login_screen.dart';
import 'package:bookia/features/auth/presentation/view/otp_verify.dart';
import 'package:bookia/features/auth/presentation/view/pass_changed.dart';
import 'package:bookia/features/auth/presentation/view/register_screen.dart';
import 'package:bookia/features/home/data/models/response/all_product_model/all_product_model/product.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/view/details_view.dart';
import 'package:bookia/features/home/presentation/view/home_view.dart';
import 'package:bookia/features/home/presentation/view/search_view.dart';
import 'package:bookia/features/main/main_app_screen.dart';
import 'package:bookia/features/splash/splash_screen.dart';
import 'package:bookia/features/welcome/welcome_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static String splashScreen = "/splash_screen";
  static String searchScreen = "/search_screen";
  static String welcomeScreen = "/welcome_screen";
  static String loginScreen = "/login_screen";
  static String registerScreen = "/register_screen";
  static String forgetPasswordScreen = "/forgetPassword_screen";
  static String otpVerifyScreen = "/otp_verify_screen";
  static String createNewPassScreen = "/create_new_pass_screen";
  static String passChangedScreen = "/pass_changed_screen";
  static String homeScreen = "/home_screen";
  static String mainAppScreen = "/main_app_screen";
  static String detailsScreen = "/details_screen";
  static var routes = GoRouter(
    initialLocation: splashScreen,
    routes: [
      GoRoute(path: splashScreen, builder: (context, state) => SplashScreen()),
      GoRoute(
        path: searchScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit(),
          child: SearchScreen(),
        ),
      ),
      GoRoute(
        path: detailsScreen,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          Product product = extra["product"] as Product;
          final source = extra["source"] as String;
          return BlocProvider(
            create: (context) => HomeCubit(),
            child: DetailsScreen(product: product, source: source),
          );
        },
      ),
      GoRoute(path: homeScreen, builder: (context, state) => HomeScreen()),
      GoRoute(
        path: mainAppScreen,
        builder: (context, state) {
          return MainAppScreen();
        },
      ),

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
