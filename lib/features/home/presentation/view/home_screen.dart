import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../widgets/best_seller_builder.dart';
import '../widgets/home_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppImages.searchNormalSvg),
          ),
        ],
        title: SvgPicture.asset(
          "assets/images/logo 2.svg",
          height: 30,
          width: 99,
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          var cubit = context.read<HomeCubit>();

          if (state is HomeSucceed) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HomeSlider(sliders: cubit.sliders),

                    Gap(20),
                    BestSellerBuilder(productList: cubit.products),
                  ],
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
