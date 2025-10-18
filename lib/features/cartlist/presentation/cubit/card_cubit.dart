import 'dart:developer';

import 'package:bookia/features/cartlist/data/models/response/card_list_response/card_list_response.dart';
import 'package:bookia/features/cartlist/data/models/response/card_list_response/cart_item.dart';
import 'package:bookia/features/cartlist/data/models/response/card_list_response/user.dart';
import 'package:bookia/features/cartlist/data/repo/cardlist_repo.dart';
import 'package:bookia/features/cartlist/presentation/cubit/card_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CardListResponse? cardListResponse;
  List<CartItem> cartItem = [];
  User? user;

  final name = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final phone = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final governorate = TextEditingController();
  int? governorateId;
  CartCubit() : super(CartInitialState());

  getCart() async {
    emit(CartLoadingState());

    var res = await CardlistRepo.getCartList();
    if (isClosed) return;

    if (res.status != 200) {
      emit(CartFailureState(message: res.message));
    } else {
      cardListResponse = res;
      cartItem = res.data?.cartItems ?? [];
      emit(CartSucceedState());
    }
  }

  removeCart(int id) async {
    if (isClosed) return;

    var res = await CardlistRepo.removeFromCart(id);
    if (res.status != 200) {
      emit(CartFailureState(message: res.message));
    } else {
      cardListResponse = res;
      cartItem = res.data?.cartItems ?? [];

      emit(CartSucceedState());
    }
  }

  updateCart({required int id, required int quantity}) async {
    if (isClosed) return;

    var res = await CardlistRepo.updateItemCart(id: id, quantity: quantity);
    if (isClosed) return;

    if (res.status != 201) {
      emit(CartFailureState(message: res.message));
    } else {
      cardListResponse = res;
      cartItem = res.data?.cartItems ?? [];
      emit(CartSucceedState());
    }
  }

  getPlaceOrder() async {
    emit(CartLoadingState());

    var res = await CardlistRepo.getPlaceOrder();
    if (isClosed) return;

    if (res.status != 200) {
      emit(CartFailureState(message: res.message));
    } else {
      user = res.data?.user;

      emit(CartSucceedState());
    }
  }

  submitOrder(User user) async {
    try {
      if (isClosed) return;
      emit(CartLoadingState());
      var res = await CardlistRepo.submitOrder(user);
      if (isClosed) return;

      if (res.status != 201) {
        emit(CartFailureState(message: res.message));
      } else {
        emit(CartSucceedState());
      }
    } on Exception catch (e) {
      log(e.toString());
      throw (e.toString());
    }
  }
}
