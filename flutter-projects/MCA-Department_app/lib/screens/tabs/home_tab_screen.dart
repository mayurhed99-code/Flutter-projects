import 'package:flutter/material.dart';

import '../../data/dummy_data.dart';
import '../../models/feature_item.dart';
import '../../theme/app_colors.dart';
import '../../widgets/action_card.dart';
import '../../widgets/campus_glimpse_section.dart';

class HomeTabScreen extends StatelessWidget {
  final ValueChanged<int> onTabChange;

  const HomeTabScreen({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    final quickLinks = const [
      FeatureItem(
        title: 'Go to Academics',
        subtitle: 'Open calendar, timetable, and assignments.',
        icon: Icons.menu_book_rounded,
        routeName: '',
        illustrationAsset: 'assets/illustrations/academic_calendar.svg',
      ),
      FeatureItem(
        title: 'Go to Notices',
        subtitle: 'Check alerts, circulars, and placements.',
        icon: Icons.notifications_rounded,
        routeName: '',
        illustrationAsset: 'assets/illustrations/notifications.svg',
      ),
      FeatureItem(
        title: 'Go to Profile',
        subtitle: 'View and edit complete student profile.',
        icon: Icons.person_rounded,
        routeName: '',
        illustrationAsset: 'assets/illustrations/profile.svg',
      ),
    ];

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Text(
              'Welcome to the MCA Student Portal. Stay ahead of deadlines, track your progress, and make every semester count. Your journey starts here..',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                height: 1.35,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 14)),
        const SliverToBoxAdapter(child: CampusGlimpseSection()),
        const SliverToBoxAdapter(child: SizedBox(height: 14)),
        const SliverToBoxAdapter(
          child: Text(
            'Quick Access',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverGrid.builder(
          itemCount: quickLinks.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 340,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.6,
          ),
          itemBuilder: (_, index) => ActionCard(
            item: quickLinks[index],
            onTap: () => onTabChange(index + 1),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        const SliverToBoxAdapter(
          child: Text(
            'Academic Highlights',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverList.builder(
          itemCount: DummyData.academicCalendar.length.clamp(0, 3),
          itemBuilder: (context, index) {
            final item = DummyData.academicCalendar[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: AppColors.surface,
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.check_circle_outline_rounded,
                  color: AppColors.primary,
                ),
                title: Text(
                  item.title,
                  style: const TextStyle(color: AppColors.textPrimary),
                ),
                subtitle: Text(
                  '${item.date} • ${item.subtitle}',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
