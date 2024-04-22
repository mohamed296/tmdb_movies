
import 'package:flutter/material.dart';
import 'package:tmdb_movies/core/config/theme/app_colors.dart';
import 'package:tmdb_movies/core/config/theme/size.dart';


/// this function is to show custom modal sheet
void showCustomModalSheet({
  required BuildContext context,
  required Widget child,
  bool isScrollControlled = true,
  bool useRootNavigator = true,
  bool useSafeArea = true,
  bool showDragHandle = true,
  Color? backgroundColor,
  ShapeBorder? shape,
  double? maxHeight,
}) {
  showModalBottomSheet<void>(
    showDragHandle: showDragHandle,
    useRootNavigator: useRootNavigator,
    useSafeArea: useSafeArea,
    isScrollControlled: isScrollControlled,
    backgroundColor: backgroundColor ?? AppColor.backgroundColor,
    context: context,
    constraints: BoxConstraints(
      maxHeight: maxHeight ?? size.height,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(designRadius),
      ),
    ),
    builder: (context) {
      return child;
    },
  );
}
