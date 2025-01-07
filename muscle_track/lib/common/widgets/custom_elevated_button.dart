import 'package:flutter/material.dart';
import 'package:muscle_track/core/core.dart';
import 'package:muscle_track/common/widgets/base_button.dart';

enum ButtonSize { medium, large }

enum ButtonDesign { primary, secondary }

class CustomElevatedButton extends BaseButton {
  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final ButtonSize size;
  final ButtonDesign buttonDesign;
  final bool isLoading;

  const CustomElevatedButton({
    super.key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    required super.text,
    super.onPressed,
    super.buttonTextStyle,
    bool super.isDisabled = false,
    super.height,
    super.width,
    super.margin,
    super.alignment,
    this.size = ButtonSize.medium,
    this.buttonDesign = ButtonDesign.primary,
    this.isLoading = false,
  });

  double _getHeight() {
    switch (size) {
      case ButtonSize.medium:
        return 58;
      case ButtonSize.large:
        return 58;
    }
  }

  double _getWidth() {
    switch (size) {
      case ButtonSize.medium:
        return 183;
      case ButtonSize.large:
        return 382;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? _getHeight(),
      width: width ?? _getWidth(),
      margin: margin,
      decoration: decoration,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonDesign == ButtonDesign.primary
              ? AppColors.buttonPrimary
              : AppColors.buttonSecondary,
          elevation: 0,
        ),
        onPressed:
            isLoading || (isDisabled ?? false) ? null : onPressed ?? () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isLoading)
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 2.5,
              )
            else ...[
              leftIcon ?? const SizedBox.shrink(),
              Text(
                text,
                style: buttonTextStyle ??
                    AppTextStyles.bodyLargeBold(
                        color: buttonDesign == ButtonDesign.primary
                            ? AppColors.white
                            : AppColors.primary),
              ),
              rightIcon ?? const SizedBox.shrink(),
            ],
          ],
        ),
      ),
    );
  }
}
