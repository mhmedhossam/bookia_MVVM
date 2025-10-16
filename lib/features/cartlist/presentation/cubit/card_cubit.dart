import 'package:bookia/features/auth/data/models/response/auth_response/data.dart';
import 'package:bookia/features/cartlist/data/models/response/card_list_response/card_list_response.dart';
import 'package:bookia/features/cartlist/data/models/response/card_list_response/cart_item.dart';
import 'package:bookia/features/cartlist/data/repo/cardlist_repo.dart';
import 'package:bookia/features/cartlist/presentation/cubit/card_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CardListResponse? cardListResponse;
  List<CartItem> cartItem = [];
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
    emit(CartLoadingState());
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
}
