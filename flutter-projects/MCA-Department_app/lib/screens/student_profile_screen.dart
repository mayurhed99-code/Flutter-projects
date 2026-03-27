import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/student_profile.dart';
import '../theme/app_colors.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({super.key});

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _rollController;
  late final TextEditingController _semesterController;
  late final TextEditingController _branchController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  StudentProfile _profile = DummyData.studentProfile;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: _profile.name);
    _rollController = TextEditingController(text: _profile.rollNo);
    _semesterController = TextEditingController(text: _profile.semester);
    _branchController = TextEditingController(text: _profile.branch);
    _emailController = TextEditingController(text: _profile.email);
    _phoneController = TextEditingController(text: _profile.phone);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _rollController.dispose();
    _semesterController.dispose();
    _branchController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickPhotoUrl() async {
    final urlController = TextEditingController(text: _profile.photoUrl);
    final photoUrl = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Upload Photo URL'),
        content: TextField(
          controller: urlController,
          decoration: const InputDecoration(
            hintText: 'Paste image URL',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          FilledButton(
            onPressed: () => Navigator.pop(context, urlController.text.trim()),
            child: const Text('Update'),
          ),
        ],
      ),
    );

    if (photoUrl == null || photoUrl.isEmpty) return;
    setState(() {
      _profile = _profile.copyWith(photoUrl: photoUrl);
    });
  }

  void _saveProfile() {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _profile = _profile.copyWith(
        name: _nameController.text.trim(),
        rollNo: _rollController.text.trim(),
        semester: _semesterController.text.trim(),
        branch: _branchController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
      );
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Student profile saved successfully.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detailed Student Profile'),
        backgroundColor: AppColors.background,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 52,
                          backgroundImage: NetworkImage(_profile.photoUrl),
                          onBackgroundImageError: (_, __) {},
                        ),
                        const SizedBox(height: 10),
                        OutlinedButton.icon(
                          onPressed: _pickPhotoUrl,
                          icon: const Icon(Icons.upload_rounded),
                          label: const Text('Upload Photo'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  _field(_nameController, 'Name'),
                  _field(_rollController, 'Roll No'),
                  _field(_semesterController, 'Semester'),
                  _field(_branchController, 'Branch'),
                  _field(
                    _emailController,
                    'Email',
                    validator: (value) => (value == null || !value.contains('@'))
                        ? 'Enter a valid email'
                        : null,
                  ),
                  _field(
                    _phoneController,
                    'Phone',
                    validator: (value) => (value == null || value.length < 10)
                        ? 'Enter a valid phone number'
                        : null,
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: _saveProfile,
                      icon: const Icon(Icons.save_rounded),
                      label: const Text('Save Profile'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _field(
    TextEditingController controller,
    String label, {
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        validator: validator ??
            (value) => (value == null || value.trim().isEmpty) ? 'Required field' : null,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: AppColors.surface,
        ),
      ),
    );
  }
}
