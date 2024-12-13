import 'package:flutter/material.dart';

class HomeSliverAppbarContent extends StatelessWidget {
  final String userName;
  final double balance;
  final void Function() onPressed;
  const HomeSliverAppbarContent(
      {super.key,
      required this.userName,
      required this.balance,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return FlexibleSpaceBar(
      background: Container(
        padding: const EdgeInsets.all(24),
        margin: EdgeInsets.only(left: 24, top: 12),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome, $userName!',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: primaryColor),
                ),
                IconButton(
                  onPressed: onPressed,
                  icon: Icon(Icons.logout, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Current Balance',
              style:
                  theme.textTheme.bodyMedium?.copyWith(color: Colors.white70),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${balance.toStringAsFixed(2)}',
              style: theme.textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontSize: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
