import 'package:bookia/core/constants/navigation.dart';
import 'package:bookia/core/constants/routes.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/home/data/models/response/all_product_model/all_product_model/product.dart';
import 'package:bookia/features/home/presentation/view/details.dart';
import 'package:bookia/features/home/presentation/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BestSellerBuilder extends StatelessWidget {
  const BestSellerBuilder({super.key, required this.productList});

  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Best Seller ",
            style: TextStyles.textStyle24.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        Gap(20),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            // crossAxisCount: 2,
            maxCrossAxisExtent: 220,
            crossAxisSpacing: 11,
            mainAxisSpacing: 11,
            mainAxisExtent: 290,
          ),
          itemCount: productList.length,
          itemBuilder: (context, i) {
            return BookCard(product: productList[i]);
          },
        ),
      ],
    );
  }
}
