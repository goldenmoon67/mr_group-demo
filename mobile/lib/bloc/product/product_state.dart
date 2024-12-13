part of 'product_bloc.dart';

enum ProductStatus { initial, loading, loaded, error }

class ProductState extends Equatable {
  final ProductStatus status;
  final List<Product>? products;
  final String? errorMessage;
  final Purchase? purchase;
  const ProductState._(
      {required this.status, this.products, this.errorMessage, this.purchase});

  const ProductState.initial() : this._(status: ProductStatus.initial);
  const ProductState.loading() : this._(status: ProductStatus.loading);
  const ProductState.loaded(List<Product> products)
      : this._(status: ProductStatus.loaded, products: products);
  const ProductState.bought(Purchase purchase)
      : this._(status: ProductStatus.loaded, purchase: purchase);
  const ProductState.error(String message)
      : this._(status: ProductStatus.error, errorMessage: message);

  @override
  List<Object?> get props => [status, products, errorMessage];
}
