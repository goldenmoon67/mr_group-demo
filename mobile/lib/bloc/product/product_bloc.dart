import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deeplink_project_for_mr_group/bloc/user/user_bloc.dart';
import 'package:deeplink_project_for_mr_group/core/repository/product_repository.dart';
import 'package:deeplink_project_for_mr_group/core/utils/exception_utils.dart';
import 'package:deeplink_project_for_mr_group/data/models/product/product.dart';
import 'package:deeplink_project_for_mr_group/data/models/purchase/purchase.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final UserBloc userBloc;
  final ProductRepository productRepository;

  ProductBloc({
    required this.productRepository,
    required this.userBloc,
  }) : super(const ProductState.initial()) {
    on<StartProduct>(_onAppStarted);
    on<BuyProduct>(_buyProduct);
  }

  Future<void> _onAppStarted(
      StartProduct event, Emitter<ProductState> emit) async {
    emit(const ProductState.loading());

    try {
      final productResponse = await productRepository.getProducts();
      emit(ProductState.loaded(productResponse.products));
    } catch (ex, stacktrace) {
      String? message = ExceptionUtils.handleException(ex, stacktrace);

      emit(ProductState.error(message ?? ""));
    }
  }

  Future<void> _buyProduct(BuyProduct event, Emitter<ProductState> emit) async {
    try {
      final purchaseResponse =
          await productRepository.buyProduct(event.productId);
      final productPrice = purchaseResponse.purchase.amount;

      userBloc.add(UpdateBalance(productPrice));

      emit(ProductState.bought(purchaseResponse.purchase));
    } catch (ex, stacktrace) {
      String? message = ExceptionUtils.handleException(ex, stacktrace);

      emit(ProductState.error(message ?? ""));
    }
  }
}
