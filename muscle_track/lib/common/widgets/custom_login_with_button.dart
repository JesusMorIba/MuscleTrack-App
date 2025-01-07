import 'package:flutter/material.dart';
import 'package:muscle_track/core/core.dart';
import 'package:muscle_track/common/widgets/base_button.dart';

class CustomLoginWithButton extends BaseButton {
  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final bool isLoading;

  const CustomLoginWithButton({
    super.key,
    this.decoration,
    this.leftIcon,
    required super.text,
    super.onPressed,
    super.buttonTextStyle,
    bool super.isDisabled = false,
    super.height = 58,
    super.width = 382,
    super.margin,
    super.alignment,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: decoration,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              side: BorderSide(
                color: AppColors.grey300,
                width: 1.0,
              )),
        ),
        onPressed:
            isLoading || (isDisabled ?? false) ? null : onPressed ?? () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leftIcon != null) leftIcon!,
            if (isLoading)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 2.5,
                ),
              ),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: buttonTextStyle ??
                    AppTextStyles.bodyLargeBold(
                      color: AppColors.black,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
