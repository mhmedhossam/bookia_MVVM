import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/home/data/models/response/all_product_model/all_product_model/product.dart';
import 'package:bookia/features/home/presentation/view/details.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Product product;

  const BookCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 170,
              width: 145,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),

                image: DecorationImage(
                  fit: BoxFit.cover,

                  image: NetworkImage(product.image!),
                ),
              ),
            ),
            Expanded(
              child: Text(
                product.name!,
                style: TextStyles.textStyle18.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.price!, style: TextStyles.textStyle16),
                MainButton(
                  bgColor: AppColors.darkColor,
                  height: 27,
                  width: 75,

                  text: "buy",
                  textColor: AppColors.backgroundColor,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          clipBehavior: Clip.antiAlias,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Details(product: product),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
