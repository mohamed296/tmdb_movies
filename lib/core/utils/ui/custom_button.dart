import 'package:flutter/material.dart';

/// CustomButton
class CustomButton extends StatelessWidget {
  /// CustomButton
  const CustomButton({
    required this.onPressed,
    required this.child,
    this.addPadding = true,
    super.key,
  });

  /// onPressed
  final void Function()? onPressed;

  /// child
  final Widget? child;

  /// add padding
  final bool addPadding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 54),
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: addPadding == true
            ? const EdgeInsets.symmetric(horizontal: 42, vertical: 16)
            : null,
      ),
      child: child,
    );
  }
}
