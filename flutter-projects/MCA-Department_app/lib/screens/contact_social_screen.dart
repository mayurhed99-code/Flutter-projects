import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_colors.dart';
import '../data/dummy_data.dart';
import 'tabs/academics_tab_screen.dart';
import 'main_shell_screen.dart';

class ContactSocialScreen extends StatelessWidget {
  const ContactSocialScreen({super.key});

  static const _collegeWebsite = 'https://www.spit.ac.in/';
  static const _linkedin = 'https://www.linkedin.com';
  static const _instagram = 'https://www.instagram.com';
  static const _twitter = 'https://twitter.com';

  Future<void> _launchUrl(BuildContext context, String raw) async {
    final uri = Uri.parse(raw);
    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched && context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Unable to open link.')));
    }
  }

  Future<void> _sendEmail(BuildContext context, String email) async {
    final mail = Uri(scheme: 'mailto', path: email);
    final launched = await launchUrl(
      mail,
      mode: LaunchMode.externalApplication,
    );
    if (!launched && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to open email client.')),
      );
    }
  }

  Future<void> _callNumber(BuildContext context, String phone) async {
    final uri = Uri(scheme: 'tel', path: phone);
    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched && context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Unable to place call.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final profile = DummyData.studentProfile;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contact & Social',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            // Glassmorphism card
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.65),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.border),
                    boxShadow: [
                      const BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.06),
                        blurRadius: 16,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Contact rows
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.public, color: AppColors.secondary),
                          const SizedBox(width: 12),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _launchUrl(context, _collegeWebsite),
                              child: const Text(
                                'https://www.spit.ac.in/',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      if (profile.phone.isNotEmpty) ...[
                        Row(
                          children: [
                            const Icon(Icons.call, color: AppColors.secondary),
                            const SizedBox(width: 12),
                            Expanded(
                              child: GestureDetector(
                                onTap: () =>
                                    _callNumber(context, profile.phone),
                                child: Text(
                                  profile.phone,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                      ],
                      const Divider(),
                      const SizedBox(height: 12),
                      // Social buttons
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final isWide = constraints.maxWidth > 480;
                          return Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              SocialButton(
                                label: 'LinkedIn',
                                icon: Icons.work_outline,
                                onTap: () => _launchUrl(context, _linkedin),
                                color: const Color(0xFF0077B5),
                                minWidth: isWide
                                    ? (constraints.maxWidth - 36) / 4
                                    : (constraints.maxWidth - 36) / 2,
                              ),
                              SocialButton(
                                label: 'Instagram',
                                icon: Icons.camera_alt_outlined,
                                onTap: () => _launchUrl(context, _instagram),
                                color: const Color(0xFFE1306C),
                                minWidth: isWide
                                    ? (constraints.maxWidth - 36) / 4
                                    : (constraints.maxWidth - 36) / 2,
                              ),
                              SocialButton(
                                label: 'Twitter',
                                icon: Icons.alternate_email,
                                onTap: () => _launchUrl(context, _twitter),
                                color: const Color(0xFF1DA1F2),
                                minWidth: isWide
                                    ? (constraints.maxWidth - 36) / 4
                                    : (constraints.maxWidth - 36) / 2,
                              ),
                              SocialButton(
                                label: 'Email',
                                icon: Icons.email_outlined,
                                onTap: () => _sendEmail(context, profile.email),
                                color: AppColors.primary,
                                minWidth: isWide
                                    ? (constraints.maxWidth - 36) / 4
                                    : (constraints.maxWidth - 36) / 2,
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: () => _launchUrl(context, _collegeWebsite),
                          icon: const Icon(Icons.public),
                          label: const Text('Visit College Website'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        onTap: (i) {
          if (i == 0) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const MainShellScreen()),
            );
          } else if (i == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AcademicsTabScreen()),
            );
          }
        },
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'Academics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page_outlined),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final double minWidth;
  final Color? color;

  const SocialButton({
    required this.label,
    required this.icon,
    required this.onTap,
    this.minWidth = 140,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: minWidth,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: color ?? AppColors.secondary),
        label: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: color ?? AppColors.secondary,
          ),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.0),
          side: BorderSide(
            color: (color ?? AppColors.border).withValues(alpha: 0.22),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        ),
      ),
    );
  }
}
