import 'package:flutter/material.dart';
import '../services/notification_service.dart';

class AssignmentReminderScreen extends StatefulWidget {
  const AssignmentReminderScreen({super.key});

  @override
  State<AssignmentReminderScreen> createState() =>
      _AssignmentReminderScreenState();
}

class _AssignmentReminderScreenState extends State<AssignmentReminderScreen> {
  final List<_Assignment> _assignments = [
    _Assignment(
      title: 'Mobile Programming build MCA app in Flutter',
      due: DateTime.now().add(const Duration(days: 3)),
    ),
    _Assignment(
      title: 'Machine Learning create model to predict student performance',
      due: DateTime.now().add(const Duration(days: 7)),
    ),
  ];
  bool _notifyEnabled = true;

  Future<void> _addAssignment() async {
    final titleController = TextEditingController();
    DateTime due = DateTime.now().add(const Duration(days: 1));
    final res = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('New Assignment'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Due:'),
                const SizedBox(width: 8),
                Expanded(child: Text(due.toLocal().toString().split(' ')[0])),
                ElevatedButton(
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: due,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (picked != null) setState(() => due = picked);
                  },
                  child: const Text('Pick'),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Add'),
          ),
        ],
      ),
    );
    if (res == true && titleController.text.isNotEmpty) {
      setState(
        () => _assignments.insert(
          0,
          _Assignment(title: titleController.text, due: due),
        ),
      );
      if (_notifyEnabled) {
        NotificationService.show(
          context,
          'Reminder set',
          'Assignment "${titleController.text}" due ${due.toLocal().toString().split(' ')[0]}',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _assignments.sort((a, b) => a.due.compareTo(b.due));
    final upcoming = _assignments
        .where((a) => a.due.isAfter(DateTime.now()))
        .take(3)
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Assignment Reminders')),
      floatingActionButton: FloatingActionButton(
        onPressed: _addAssignment,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text('Upcoming assignments: ${upcoming.length}'),
                    ),
                    Switch(
                      value: _notifyEnabled,
                      onChanged: (v) => setState(() => _notifyEnabled = v),
                    ),
                    const Text('Notifications'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: _assignments.length,
                itemBuilder: (context, i) {
                  final a = _assignments[i];
                  final daysLeft = a.due.difference(DateTime.now()).inDays;
                  return Card(
                    child: ListTile(
                      title: Text(a.title),
                      subtitle: Text(
                        'Due: ${a.due.toLocal().toString().split(' ')[0]} • $daysLeft days left',
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.notifications),
                        onPressed: () => NotificationService.show(
                          context,
                          'Upcoming',
                          '${a.title} is due ${a.due.toLocal().toString().split(' ')[0]}',
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Assignment {
  final String title;
  final DateTime due;
  _Assignment({required this.title, required this.due});
}
