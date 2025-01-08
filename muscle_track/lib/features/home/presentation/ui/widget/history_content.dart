import 'package:flutter/material.dart';
import 'package:muscle_track/common/common.dart';

class HistoryContent extends StatefulWidget {
  const HistoryContent({super.key});

  @override
  HistoryContentState createState() => HistoryContentState();
}

class HistoryContentState extends State<HistoryContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomCalendar(),
        ],
      ),
    );
  }
}
