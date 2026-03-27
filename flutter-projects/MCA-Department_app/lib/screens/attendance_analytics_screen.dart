import 'package:flutter/material.dart';

class AttendanceAnalyticsScreen extends StatelessWidget {
  const AttendanceAnalyticsScreen({super.key});

  static const List<double> _percentages = [92, 85, 78, 88, 95, 90, 82];
  static const List<String> _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
  ];
  static const List<Map<String, dynamic>> _topStudents = [
    {'name': 'Mayur', 'attendance': 98},
    {'name': 'Harsh', 'attendance': 96},
    {'name': 'Shreyas', 'attendance': 95},
  ];
  static const List<Map<String, dynamic>> _atRisk = [
    {'name': 'Gaurav', 'attendance': 65},
    {'name': 'Kiran', 'attendance': 58},
  ];

  double get _average =>
      _percentages.reduce((a, b) => a + b) / _percentages.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Attendance Analytics')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Average Attendance',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${_average.toStringAsFixed(1)}%',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'This term - shows the average across batches.',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: _average / 100,
                            strokeWidth: 10,
                          ),
                          Text('${_average.toStringAsFixed(0)}%'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Monthly trend',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 220,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List<Widget>.generate(_percentages.length, (i) {
                  final value = _percentages[i];
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Tooltip(
                            message: '${value.toStringAsFixed(0)}%',
                            child: _Bar(value: value),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _months[i],
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: [
                  const Text(
                    'Highlights',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Top performers',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          ..._topStudents.map(
                            (s) => ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(s['name'] as String),
                              trailing: Text('${s['attendance']}%'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'At-risk students',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ..._atRisk.map(
                            (s) => ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(s['name'] as String),
                              trailing: Text('${s['attendance']}%'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  final double value;
  const _Bar({required this.value,});

  @override
  Widget build(BuildContext context) {
    const maxHeight = 180.0;
    final height = (value / 100) * maxHeight;
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
