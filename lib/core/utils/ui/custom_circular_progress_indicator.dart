import 'package:flutter/material.dart';
import 'package:tmdb_movies/core/config/theme/app_colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key,
    required this.value,
    required this.text,
    this.textSize,
    this.textColor,
    required this.size,
    this.strokeWidth = 8,
  });

  final double value;
  final String text;
  final double? textSize;
  final Color? textColor;
  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: value,
              color: AppColor.onPrimary,
              strokeWidth: strokeWidth,
              strokeCap: StrokeCap.round,
              backgroundColor: AppColor.borderColor,
            ),
          ),
          Text(
            text,
            style: textSize != null
                ? Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: textColor ?? AppColor.onPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: textSize,
                    )
                : Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: textColor ?? AppColor.onPrimary,
                      fontWeight: FontWeight.w500,
                    ),
          ),
        ],
      ),
    );
  }
}
