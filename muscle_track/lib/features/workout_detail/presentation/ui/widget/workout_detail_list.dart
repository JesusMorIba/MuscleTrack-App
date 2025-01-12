import 'package:flutter/material.dart';

class WorkoutDetailList extends StatelessWidget {
  const WorkoutDetailList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                'https://imgur.com/pPNGyli.png',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 40,
                left: 16,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),

          // Title and Description Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Full-Body HIIT Blast',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Get ready for an intense full-body workout that will boost your metabolism and torch calories. This high-intensity interval training (HIIT) program is designed to increase strength and endurance.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatCard('15', 'workouts'),
                    _buildStatCard('20', 'minutes'),
                    _buildStatCard('250', 'kcal'),
                  ],
                ),
              ],
            ),
          ),

          // Tab Section (Animation / Video)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Animation', style: TextStyle(fontSize: 16)),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Video', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),

          // Exercise List Section
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                final exercise = exercises[index];
                return ListTile(
                  leading: Image.network(
                    exercise['imageUrl']!,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(exercise['name']!),
                  subtitle: Text(exercise['reps']!),
                  trailing: Icon(Icons.drag_handle),
                );
              },
            ),
          ),

          // Start Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Center(
                child: Text(
                  'START',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build stat cards
  Widget _buildStatCard(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

// Sample exercise data
final exercises = [
  {
    'imageUrl': 'https://via.placeholder.com/50',
    'name': 'Push-up',
    'reps': 'X10',
  },
  {
    'imageUrl': 'https://via.placeholder.com/50',
    'name': 'Plank',
    'reps': '00:40',
  },
  {
    'imageUrl': 'https://via.placeholder.com/50',
    'name': 'Leg Raises 1',
    'reps': 'X15',
  },
  // Add more exercises here
];
