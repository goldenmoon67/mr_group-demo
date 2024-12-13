import 'package:deeplink_project_for_mr_group/data/models/product/product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  final void Function() onTap;
  final IconData mockIcon;
  const ProductItem(
      {super.key,
      required this.product,
      required this.onTap,
      required this.mockIcon});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: Row(
          children: [
            Hero(
              tag: widget.product.id,
              child: Icon(
                widget.mockIcon,
                color: theme.colorScheme.primary,
                size: 32,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                widget.product.name,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            Text(
              '\$${widget.product.price.toStringAsFixed(2)}',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
