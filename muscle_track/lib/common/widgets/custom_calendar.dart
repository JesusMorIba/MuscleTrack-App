import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:muscle_track/core/core.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  CustomCalendarState createState() => CustomCalendarState();
}

class CustomCalendarState extends State<CustomCalendar> {
  late DateTime _currentMonth;
  late List<DateTime> _daysInMonth;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _currentMonth = DateTime.now();
    _daysInMonth = _generateDaysInMonth(_currentMonth);
  }

  List<DateTime> _generateDaysInMonth(DateTime month) {
    final lastDay = DateTime(month.year, month.month + 1, 0);
    return List.generate(
      lastDay.day,
      (index) => DateTime(month.year, month.month, index + 1),
    );
  }

  // Cambia el mes (anterior o siguiente)
  void _changeMonth(int increment) {
    setState(() {
      _currentMonth =
          DateTime(_currentMonth.year, _currentMonth.month + increment, 1);
      _daysInMonth = _generateDaysInMonth(_currentMonth);
      _selectedDay = null;
    });
  }

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

  // Widget: Días de la semana (Mo, Tu, We, ...)
  Widget _buildDaysOfWeek() {
    const daysOfWeek = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: daysOfWeek
          .map(
            (day) => Text(
              day,
              style: AppTextStyles.bodyLargeSemiBold(),
            ),
          )
          .toList(),
    );
  }

  // Widget: Grid de los días del mes
  Widget _buildDaysGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _daysInMonth.length + _daysInMonth.first.weekday - 1,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7, // 7 días por semana
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        // Espacios vacíos antes del primer día del mes
        if (index < _daysInMonth.first.weekday - 1) {
          return const SizedBox.shrink();
        }

        // Días reales del mes
        final day = _daysInMonth[index - _daysInMonth.first.weekday + 1];
        final isSelected = _selectedDay != null && day == _selectedDay;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedDay = day; // Actualiza el día seleccionado
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.white,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '${day.day}',
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
