/* import 'package:flutter/material.dart';

class CustomHistory extends StatelessWidget {
  const CustomHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 0.5,
        ),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Encabezado del calendario
          _buildHeader(),
          Divider(
            color: Colors.grey.shade300,
            thickness: 0.5,
            height: 1,
          ),
          const SizedBox(height: 10),
          // Días de la semana
          _buildDaysOfWeek(),
          const SizedBox(height: 10),
          // Días del mes
          _buildDaysGrid(),
        ],
      ),
    );
  }

  // Widget: Encabezado con el mes y botones de navegación
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => _changeMonth(-1),
        ),
        Text(
          DateFormat.yMMMM().format(_currentMonth),
          style: AppTextStyles.heading5(),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: () => _changeMonth(1),
        ),
      ],
    );
  }
}
 */
