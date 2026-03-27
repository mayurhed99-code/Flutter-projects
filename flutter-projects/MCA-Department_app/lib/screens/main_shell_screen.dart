import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';
import '../routes/app_routes.dart';
import 'tabs/academics_tab_screen.dart';
import 'tabs/home_tab_screen.dart';
import 'tabs/notices_tab_screen.dart';
import 'tabs/profile_tab_screen.dart';
import 'contact_social_screen.dart';
import 'faculty_screen.dart';

class MainShellScreen extends StatefulWidget {
  const MainShellScreen({super.key});

  @override
  State<MainShellScreen> createState() => _MainShellScreenState();
}

class _MainShellScreenState extends State<MainShellScreen> {
  int _index = 0;

  static const _titles = [
    'MCA Department Dashboard',
    'Academics',
    'Notices',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeTabScreen(
        onTabChange: (tabIndex) => setState(() => _index = tabIndex),
      ),
      const AcademicsTabScreen(),
      const NoticesTabScreen(),
      const ProfileTabScreen(),
    ];

    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: AppColors.primary),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'SPIT App',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Department Dashboard',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                selected: _index == 0,
                onTap: () => setState(() {
                  _index = 0;
                  Navigator.pop(context);
                }),
              ),
              ListTile(
                leading: const Icon(Icons.menu_book),
                title: const Text('Academics'),
                selected: _index == 1,
                onTap: () => setState(() {
                  _index = 1;
                  Navigator.pop(context);
                }),
              ),
              ListTile(
                leading: const Icon(Icons.announcement),
                title: const Text('Notices'),
                selected: _index == 2,
                onTap: () => setState(() {
                  _index = 2;
                  Navigator.pop(context);
                }),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                selected: _index == 3,
                onTap: () => setState(() {
                  _index = 3;
                  Navigator.pop(context);
                }),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.group),
                title: const Text('Faculty'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const FacultyScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.bar_chart),
                title: const Text('Attendance Analytics'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(
                    context,
                  ).pushNamed(AppRoutes.attendanceAnalytics);
                },
              ),
              ListTile(
                leading: const Icon(Icons.calculate),
                title: const Text('GPA Calculator'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed(AppRoutes.gpaCalculator);
                },
              ),
              ListTile(
                leading: const Icon(Icons.assignment_late),
                title: const Text('Assignment Reminders'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(
                    context,
                  ).pushNamed(AppRoutes.assignmentReminders);
                },
              ),
              ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text('Admin Dashboard'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed(AppRoutes.adminDashboard);
                },
              ),
              ListTile(
                leading: const Icon(Icons.contact_page_outlined),
                title: const Text('Contact & Social'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ContactSocialScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.background,
        titleSpacing: 12,
        title: Row(
          children: [
            Container(
              height: 42,
              width: 42,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: SvgPicture.asset('assets/branding/spit_logo.svg'),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _titles[_index],
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const Text(
                    'Computer Engineering Department',
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
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 220),
        child: Padding(
          key: ValueKey<int>(_index),
          padding: const EdgeInsets.all(16),
          child: pages[_index],
        ),
      ),
    );
  }
}
