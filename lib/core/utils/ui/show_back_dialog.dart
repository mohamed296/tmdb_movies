import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Show Back Dialog
void showBackDialog(BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog.adaptive(
        insetPadding: EdgeInsets.zero,
        title: const Text(
          'You have unsaved changes!',
          style: TextStyle(fontSize: 16),
        ),
        content: const Text(
          'Are you sure you want to leave?',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Stay'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            // text color is 'DF4D4D'
            child: const Text(
              'Leave',
              style: TextStyle(
                color: Color(0xFFDF4D4D),
              ),
            ),
            onPressed: () {
              context
                ..pop()
                ..pop();
            },
          ),
        ],
      );
    },
  );
}
