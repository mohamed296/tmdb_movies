import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tmdb_movies/core/utils/ui/custom_text_form.dart';

/// Search Bar
/// !!! You Need to provide Focus Node to discard
/// !!! keyboard when user click outside
class CustomSearchBar extends HookWidget {
  /// Search Bar Constructor
  const CustomSearchBar({
    required this.onChange,
    this.controller,
    this.focusNode,
    super.key,
  });

  /// onChange function to handle search by letter
  final void Function(String)? onChange;

  ///
  final TextEditingController? controller;

  ///
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    Timer? debounce = Timer(Duration.zero, () {});

    return CustomTextField(
      hint: "search movies...",
      showPrefixIcon: true,
      keyboardType: TextInputType.text,
      currentFocus: focusNode!,
      controller: controller!,
      isPrefixIcon: true,
      prefixIcon: Icons.search,
      iconColor: Colors.grey,
      label: '',
      onChange: (value) {
        if (debounce != null && debounce!.isActive) {
          debounce!.cancel();
        }

        debounce = Timer(const Duration(milliseconds: 700), () {
          onChange!.call(value);
        });
      },
    );
  }
}
