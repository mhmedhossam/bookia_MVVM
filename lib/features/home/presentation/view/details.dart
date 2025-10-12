import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/home/data/models/response/all_product_model/all_product_model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Details extends StatelessWidget {
  final Product? product;
  const Details({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: CustomBackButton(),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: SvgPicture.asset(AppImages.bookmarkSvg),
      //     ),
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  clipBehavior: Clip.antiAlias,

                  child: Image.network(
                    product!.image!,
                    height: 270,
                    width: 183,
                    fit: BoxFit.cover,
                  ),
                ),
                Gap(20),
                Padding(
                  padding: EdgeInsetsGeometry.only(left: 30),
                  child: Text(
                    product!.name!,
                    style: TextStyles.textStyle30,
                    maxLines: 1,
                  ),
                ),
                Text(product!.category!, style: TextStyles.textStyle14),
                Text(product!.description!, style: TextStyles.textStyle14),
                Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product!.price!, style: TextStyles.textStyle16),
                    MainButton(
                      onPressed: () {},
                      bgColor: AppColors.darkColor,
                      height: 40,
                      width: 150,

                      text: "Add to Cart",
                      textColor: AppColors.backgroundColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
