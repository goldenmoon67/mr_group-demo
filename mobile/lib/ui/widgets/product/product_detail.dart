import 'package:deeplink_project_for_mr_group/data/models/product/product.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final Product product;
  final IconData icon;
  final void Function() onBuy;
  const ProductDetail(
      {super.key,
      required this.product,
      required this.icon,
      required this.onBuy});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Hero(
              tag: widget.product.id,
              child: Icon(
                widget.icon,
                color: theme.colorScheme.primary,
                size: 100,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '\$${widget.product.price.toStringAsFixed(2)}',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                bool? confirmed = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Are you sure?'),
                    content: const Text(
                        'Are you sure you want to buy this product?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          widget.onBuy();
                          Navigator.pop(context, true);
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                );

                if (confirmed == true) {
                  _showSnacbar();
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
              ),
              child: Text(
                'Buy Now',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSnacbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${widget.product.name} has been bought.')),
    );
  }
}
