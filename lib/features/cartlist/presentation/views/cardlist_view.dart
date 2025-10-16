import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/cartlist/presentation/widgets/card_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardlistView extends StatelessWidget {
  const CardlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: TextStyles.textStyle18),
                  Text("1522", style: TextStyles.textStyle18),
                ],
              ),
            ),
            Gap(20),
            MainButton(
              onPressed: () {},
              text: "Checkout",
              bgColor: AppColors.primaryColor,
              textColor: AppColors.backgroundColor,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("My Cart", style: TextStyles.textStyle20),
        centerTitle: true,
      ),
      body: CardListBuilder(),
    );
  }
}
