import 'package:bookia/features/cartlist/presentation/cubit/card_cubit.dart';
import 'package:bookia/features/cartlist/presentation/cubit/card_states.dart';
import 'package:bookia/features/cartlist/presentation/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/widgets/empty_list_widget.dart';

class CardListBuilder extends StatelessWidget {
  const CardListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CartCubit>();
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        if (state is CartSucceedState) {
          if (cubit.cartItem.isEmpty) {
            return EmptyListWidget(text: "Empty Card");
          } else {
            return ListView.separated(
              padding: const EdgeInsets.all(22),
              separatorBuilder: (context, i) =>
                  Divider(color: Color(0xffF0F0F0)),

              itemCount: cubit.cartItem.length,
              itemBuilder: (context, i) {
                return CartCard(
                  decrease: () {
                    if ((cubit.cartItem[i].itemQuantity ?? 0) > 1) {
                      cubit.updateCart(
                        id: cubit.cartItem[i].itemId ?? 0,
                        quantity: (cubit.cartItem[i].itemQuantity ?? 0) - 1,
                      );
                    }
                  },
                  increase: () {
                    cubit.updateCart(
                      id: cubit.cartItem[i].itemId ?? 0,
                      quantity: (cubit.cartItem[i].itemQuantity ?? 0) + 1,
                    );
                  },
                  cartModel: cubit.cartItem[i],
                  onPressed: () {
                    cubit.removeCart(cubit.cartItem[i].itemId ?? 0);
                  },
                );
              },
            );
          }
        } else if (state is CartFailureState) {
          return Center(child: Text(state.message ?? ""));
        } else {
          return Center(child: Lottie.asset('assets/images/Open book.json'));
        }
      },
    );
  }
}
