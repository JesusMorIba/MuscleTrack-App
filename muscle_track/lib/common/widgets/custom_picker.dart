import 'package:flutter/material.dart';
import 'package:muscle_track/core/theme/app_colors.dart';
import 'package:muscle_track/core/theme/app_text_styles.dart';

class CustomPicker extends StatefulWidget {
  final String unit;
  final int minValue;
  final int maxValue;
  final int defaultValue;
  final double containerHeight;
  final double itemHeight;
  final ValueChanged<int>? onValueChanged;

  const CustomPicker({
    super.key,
    required this.unit,
    required this.minValue,
    required this.maxValue,
    required this.defaultValue,
    this.onValueChanged,
    this.containerHeight = 527,
    this.itemHeight = 58,
  });

  @override
  CustomPickerState createState() => CustomPickerState();
}

class CustomPickerState extends State<CustomPicker> {
  late int currentValue;
  late FixedExtentScrollController scrollController;

  @override
  void initState() {
    super.initState();
    currentValue = widget.defaultValue;
    final initialItem = currentValue - widget.minValue;
    scrollController = FixedExtentScrollController(initialItem: initialItem);
  }

  @override
  Widget build(BuildContext context) {
    const int totalVisibleItems = 9;
    final double centerOffset =
        (widget.containerHeight - widget.itemHeight * totalVisibleItems) / 2;

    return SizedBox(
      height: widget.containerHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: ListWheelScrollView.useDelegate(
              controller: scrollController,
              itemExtent: widget.itemHeight,
              perspective: 0.0001,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                setState(() {
                  currentValue = widget.minValue + index;
                });
              },
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  final itemValue = widget.minValue + index;
                  final distance =
                      (index - (currentValue - widget.minValue)).abs();

                  TextStyle style;
                  if (distance == 0) {
                    style = AppTextStyles.heading1(color: AppColors.primary);
                  } else if (distance == 1) {
                    style = AppTextStyles.heading2SemiBold(
                        color: AppColors.grey800);
                  } else if (distance == 2) {
                    style = AppTextStyles.heading3SemiBold(
                        color: AppColors.grey700);
                  } else if (distance == 3) {
                    style = AppTextStyles.heading4SemiBold(
                        color: AppColors.grey600);
                  } else {
                    style = AppTextStyles.heading5SemiBold(
                        color: AppColors.grey500);
                  }

                  return Container(
                    height: widget.itemHeight,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '$itemValue',
                          style: style.copyWith(height: 1.0),
                        ),
                        const SizedBox(width: 8),
                        if (distance == 0)
                          Text(
                            widget.unit,
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey.shade800),
                          ),
                      ],
                    ),
                  );
                },
                childCount: widget.maxValue - widget.minValue + 1,
              ),
            ),
          ),
          Positioned(
            top: centerOffset + widget.itemHeight * 4,
            child: Container(
              width: 180,
              height: 1,
              color: AppColors.primary,
            ),
          ),
          Positioned(
            bottom: centerOffset + widget.itemHeight * 4,
            child: Container(
              width: 180,
              height: 1,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
