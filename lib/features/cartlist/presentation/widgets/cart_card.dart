import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/cartlist/data/models/response/card_list_response/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class CartCard extends StatelessWidget {
  final VoidCallback onPressed;
  int x = 1;
  final CartItem cartModel;

  CartCard({super.key, required this.cartModel, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.backgroundColor.withValues(alpha: 0.2),
      ),
      width: double.infinity,
      height: 145,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              cartModel.itemProductImage ?? "",
              fit: BoxFit.cover,
              height: 118,
              width: 100,
            ),
          ),
          Gap(20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 160,
                      child: Text(
                        cartModel.itemProductName ?? "",
                        style: TextStyles.textStyle18,
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: onPressed,

                      icon: SvgPicture.asset(
                        AppImages.xIconSvg,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ),
                Text(
                  cartModel.itemProductPrice ?? "",
                  style: TextStyles.textStyle16,
                ),

                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: AppColors.greyColor.withValues(alpha: 0.2),

                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.add),
                      ),
                    ),
                    Text(
                      x.toString().padLeft(2, '0'),
                      style: TextStyles.textStyle18,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 15, 0),

                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: AppColors.greyColor.withValues(alpha: 0.2),

                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.remove),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
