import 'package:flutter/material.dart';

class GpaCalculatorScreen extends StatefulWidget {
  const GpaCalculatorScreen({super.key});

  @override
  State<GpaCalculatorScreen> createState() => _GpaCalculatorScreenState();
}

class _GpaCalculatorScreenState extends State<GpaCalculatorScreen> {
  final List<_Course> _courses = [];

  void _addCourse() =>
      setState(() => _courses.add(_Course(credits: 3, grade: 8.0)));

  double _calculateGpa() {
    if (_courses.isEmpty) return 0.0;
    double totalPoints = 0;
    double totalCredits = 0;
    for (final c in _courses) {
      totalPoints += c.grade * c.credits;
      totalCredits += c.credits;
    }
    return totalCredits == 0 ? 0.0 : totalPoints / totalCredits;
  }

  @override
  Widget build(BuildContext context) {
    final gpa = _calculateGpa();
    return Scaffold(
      appBar: AppBar(title: const Text('GPA Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: _addCourse,
                  icon: const Icon(Icons.add),
                  label: const Text('Add Course'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Grade scale',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 6),
                          Text(
                            '9-10: O (Outstanding)\n7-8.9: A\n5-6.9: B\n0-4.9: C',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: _courses.length,
                itemBuilder: (context, i) {
                  final c = _courses[i];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(child: Text('${i + 1}')),
                      title: Row(
                        children: [
                          Text('Credits: ${c.credits}'),
                          const SizedBox(width: 12),
                          Text('Grade: ${c.grade.toStringAsFixed(1)}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () async {
                              final res = await showDialog<_Course?>(
                                context: context,
                                builder: (_) =>
                                    _EditCourseDialog(course: _courses[i]),
                              );
                              if (res != null)
                                setState(() => _courses[i] = res);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () =>
                                setState(() => _courses.removeAt(i)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    const Text(
                      'Calculated GPA: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      gpa.toStringAsFixed(2),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Course {
  int credits;
  double grade;
  _Course({required this.credits, required this.grade});
}

class _EditCourseDialog extends StatefulWidget {
  final _Course course;
  const _EditCourseDialog({required this.course});

  @override
  State<_EditCourseDialog> createState() => _EditCourseDialogState();
}

class _EditCourseDialogState extends State<_EditCourseDialog> {
  late int credits;
  late double grade;

  @override
  void initState() {
    super.initState();
    credits = widget.course.credits;
    grade = widget.course.grade;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Course'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            initialValue: credits.toString(),
            decoration: const InputDecoration(labelText: 'Credits'),
            keyboardType: TextInputType.number,
            onChanged: (v) => credits = int.tryParse(v) ?? credits,
          ),
          TextFormField(
            initialValue: grade.toString(),
            decoration: const InputDecoration(labelText: 'Grade (0-10)'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: (v) => grade = double.tryParse(v) ?? grade,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () =>
              Navigator.pop(context, _Course(credits: credits, grade: grade)),
          child: const Text('Save'),
        ),
      ],
    );
  }
}
