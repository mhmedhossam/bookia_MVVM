import 'package:bookia/features/cartlist/data/models/response/card_list_response/cart_item.dart';
import 'package:bookia/features/cartlist/data/repo/cardlist_repo.dart';
import 'package:bookia/features/cartlist/presentation/cubit/card_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  List<CartItem> cartItem = [];
  CartCubit() : super(CartInitialState());

  getCart() async {
    emit(CartLoadingState());

    var res = await CardlistRepo.getCartList();
    if (isClosed) return;

    if (res.status != 200) {
      emit(CartFailureState(message: res.message));
    } else {
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
      cartItem = res.data?.cartItems ?? [];

      emit(CartSucceedState());
    }
  }
}
