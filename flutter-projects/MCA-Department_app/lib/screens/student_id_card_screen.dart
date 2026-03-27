import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../theme/app_colors.dart';

class StudentIdCardScreen extends StatelessWidget {
  const StudentIdCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = DummyData.studentProfile;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student ID Card'),
        backgroundColor: AppColors.background,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.border),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(30, 42, 56, 0.08),
                    blurRadius: 14,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 46,
                        width: 46,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(197, 161, 0, 0.14),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.account_balance_rounded,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sardar Patel Institute of Technology',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Official Student Identification',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CircleAvatar(
                    radius: 44,
                    backgroundImage: NetworkImage(profile.photoUrl),
                    onBackgroundImageError: (_, error) {},
                  ),
                  const SizedBox(height: 12),
                  Text(
                    profile.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    profile.branch,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 14),
                  _IdCardField(label: 'Roll No', value: profile.rollNo),
                  const SizedBox(height: 8),
                  _IdCardField(label: 'Semester', value: profile.semester),
                  const SizedBox(height: 8),
                  _IdCardField(label: 'Email', value: profile.email),
                  const SizedBox(height: 8),
                  _IdCardField(label: 'Phone', value: profile.phone),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _IdCardField extends StatelessWidget {
  final String label;
  final String value;

  const _IdCardField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(244, 246, 248, 0.65),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
