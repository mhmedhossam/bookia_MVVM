import 'package:bookia/core/constants/navigation.dart';
import 'package:bookia/core/constants/routes.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/dialog.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/auth/presentation/cubit/authstates.dart';
import 'package:bookia/features/auth/presentation/cubit/authtcubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class PassChanged extends StatefulWidget {
  String? token;
  PassChanged({super.key, this.token});

  @override
  State<PassChanged> createState() => _PassChangedState();
}

class _PassChangedState extends State<PassChanged> {
  @override
  void initState() {
    passfn();
    super.initState();
  }

  void passfn() async {
    await context.read<Authtcubit>().passchanged(widget.token ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<Authtcubit, Authstates>(
        listener: (context, state) {
          if (state is AuthFailure) {
            showErrorDialog(context, state.errorMessage);
          } else {
            if (Navigator.canPop(context)) {
              Navigation.pop(context);
            }
          }
        },
        builder: (context, state) {
          if (state is AuthSuccessed) {
            return Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/successimage.svg",
                    width: 100,
                    height: 100,
                  ),
                  Gap(20),
                  Text(
                    "Password Changed!",
                    style: TextStyles.textStyle24.copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),
                  Text(
                    "Your password has been changed .",
                    style: TextStyles.textStyle15.copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),
                  Text(
                    "successfully.",
                    style: TextStyles.textStyle15.copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),
                  Gap(40),
                  MainButton(
                    text: "Back to Login",
                    textColor: AppColors.backgroundColor,

                    // labelwidget: TextWidget(text: "Back to Login", size: 15),
                    bgColor: AppColors.primaryColor,

                    onPressed: () {
                      Navigation.pushNamedandRemoveUntilTo(
                        context,
                        Routes.loginScreen,
                      );
                    },
                  ),
                ],
              ),
            );
          } else if (state is AuthFailure) {
            return Text("Error please try again");
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
