import 'package:bookia/features/home/data/models/response/all_product_model/all_product_model/product.dart';
import 'package:bookia/features/home/data/models/response/slider_model/slider.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:bookia/features/home/presentation/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  List<SliderModel> sliders = [];
  List<Product> products = [];
  String? token;
  HomeCubit({this.token}) : super(InitialState());

  getslider() async {
    emit(HomeLoading());
    var res = await HomeRepo.getSlider();

    if (res.status != 200) {
      emit(HomeFailure(message: res.message!));
    } else {
      sliders = res.data!.sliders ?? [];
      emit(HomeSucceed());

      return sliders;
    }
  }

  getBestSeller() async {
    emit(HomeLoading());
    var res = await HomeRepo.getBestSellerPduct();

    if (res.status != 200 || token == null) {
      emit(HomeFailure(message: res.message!));
    } else {
      products = res.data!.products ?? [];
      emit(HomeSucceed());

      return sliders;
    }
  }
}
