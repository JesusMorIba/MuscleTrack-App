import 'package:flutter/material.dart';
import 'package:muscle_track/core/core.dart';
import 'package:muscle_track/common/widgets/custom_error_alert.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final String? errorMessage;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Color? fillColor;
  final Widget? leftIcon;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.errorMessage,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.fillColor = AppColors.grey100,
    this.leftIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyXLargeSemiBold(color: AppColors.dark1),
        ),
        TextFormField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle:
                AppTextStyles.bodyXLargeRegular(color: AppColors.grey500),
            prefixIcon: leftIcon != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: leftIcon,
                    ),
                  )
                : null,
            filled: true,
            fillColor: fillColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: fillColor!,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 2,
              ),
            ),
          ),
        ),
        if (errorMessage != null && errorMessage!.isNotEmpty)
          CustomErrorAlert(message: errorMessage!),
      ],
    );
  }
}
