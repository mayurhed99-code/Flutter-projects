import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class FacultyScreen extends StatelessWidget {
  const FacultyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faculty'),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _facultyList.length,
        itemBuilder: (context, i) {
          final f = _facultyList[i];
          return FacultyTile(f: f);
        },
      ),
    );
  }
}

class Faculty {
  final String name;
  final String designation;
  final String email;
  final String phone;

  Faculty({
    required this.name,
    required this.designation,
    required this.email,
    this.phone = '',
  });
}

final List<Faculty> _facultyList = [
  Faculty(
    name: 'Dr. Dhananjay kalbande',
    designation: 'Head of Department',
    email: 'dhkalbande@spit.ac.in',
    phone: '+91 98100 00001',
  ),
  Faculty(
    name: 'Prof. Harshil Kanakia',
    designation: 'Assistant Professor',
    email: 'h.kanakia@spit.ac.in',
    phone: '+91 98100 00002',
  ),
  Faculty(
    name: 'Prof. Pallavi Thakur',
    designation: 'Associate Professor',
    email: 'p.thakur@spit.ac.in',
    phone: '+91 98100 00003',
  ),
  Faculty(
    name: 'Prof. Nikhita Mangaonkar',
    designation: 'Associate Professor',
    email: 'n.mangaonkar@spit.ac.in',
    phone: '+91 98100 00004',
  ),
  Faculty(
    name: 'Dr. Aarti Karande',
    designation: 'Assistant Professor',
    email: 'a.karande@spit.ac.in',
    phone: '+91 98100 00005',
  ),
  Faculty(
    name: 'Prof. Radha Padelkar',
    designation: 'Professor',
    email: 'p.padelpkar@spit.ac.in',
    phone: '+91 98100 00006',
  ),
];

class FacultyTile extends StatelessWidget {
  final Faculty f;

  const FacultyTile({required this.f, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color.fromRGBO(197, 161, 0, 0.12),
              foregroundColor: AppColors.secondary,
              child: Text(f.name.split(' ').map((s) => s[0]).take(2).join()),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    f.name,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    f.designation,
                    style: const TextStyle(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    f.email,
                    style: const TextStyle(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            OutlinedButton.icon(
              onPressed: () => _showReviewDialog(context, f),
              icon: const Icon(Icons.rate_review_outlined),
              label: const Text('Review'),
            ),
          ],
        ),
      ),
    );
  }
}

void _showReviewDialog(BuildContext context, Faculty f) {
  showDialog(
    context: context,
    builder: (_) => ReviewDialog(faculty: f),
  );
}

class ReviewDialog extends StatefulWidget {
  final Faculty faculty;
  const ReviewDialog({required this.faculty, super.key});

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  int _rating = 5;
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Review ${widget.faculty.name}'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (i) => IconButton(
                icon: Icon(
                  i < _rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                ),
                onPressed: () => setState(() => _rating = i + 1),
              ),
            ),
          ),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(labelText: 'Comments (optional)'),
            minLines: 1,
            maxLines: 3,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final comment = _controller.text.trim();
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Thanks for reviewing ${widget.faculty.name} (⭐ $_rating)${comment.isEmpty ? '' : ': $comment'}',
                ),
              ),
            );
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
