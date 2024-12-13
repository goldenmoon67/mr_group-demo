part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class StartProduct extends ProductEvent {}

class RefreshProduct extends ProductEvent {}

class BuyProduct extends ProductEvent {
  final String productId;

  const BuyProduct({required this.productId});
}
