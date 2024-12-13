import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final bool isLoading;
  final void Function() submit;
  final String text;
  const PrimaryButton(
      {super.key,
      required this.isLoading,
      required this.submit,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : submit,
      child: isLoading
          ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          : Text(text),
    );
  }
}
