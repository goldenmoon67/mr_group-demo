import 'package:deeplink_project_for_mr_group/bloc/product/product_bloc.dart';
import 'package:deeplink_project_for_mr_group/data/models/product/product.dart';
import 'package:deeplink_project_for_mr_group/ui/widgets/product/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  final IconData icon;
  const ProductDetailScreen(
      {super.key, required this.product, required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: primaryColor,
      ),
      body: BlocProvider(
        create: (context) => context.read<ProductBloc>(),
        child: ProductDetail(
          onBuy: () {
            context.read<ProductBloc>().add(BuyProduct(productId: product.id));
          },
          product: product,
          icon: icon,
        ),
      ),
    );
  }
}
