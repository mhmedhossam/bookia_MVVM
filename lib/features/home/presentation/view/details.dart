import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/home/data/models/response/all_product_model/all_product_model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:html/parser.dart' as html_parser;

class Details extends StatelessWidget {
  final Product? product;
  const Details({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 15, right: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$${product!.price!}", style: TextStyles.textStyle24),
            MainButton(
              onPressed: () {},
              bgColor: AppColors.darkColor,
              height: 56,
              width: 212,

              text: "Add to Cart",
              size: 20,
              textColor: AppColors.backgroundColor,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomBackButton(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppImages.bookmarkSvg),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    product!.image!,
                    height: 270,
                    width: 183,
                    fit: BoxFit.cover,
                  ),
                ),
                Gap(20),
                SizedBox(
                  width: 247,
                  height: 78,
                  child: Text(
                    product!.name!,
                    style: TextStyles.textStyle30,
                    maxLines: 2,

                    textAlign: TextAlign.center,
                  ),
                ),
                Gap(5),
                Text(
                  product!.category!,
                  style: TextStyles.textStyle14.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  html_parser.parse(product!.description).body!.text,
                  style: TextStyles.textStyle14,
                ),
                Gap(
                  MediaQuery.of(context).size.width * 0.19,
                ), // هنا الى اقصد عليها
              ],
            ),
          ),
        ),
      ),
    );
  }
}
