import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../models/info_item.dart';

class ListDetailScreen extends StatelessWidget {
  final String title;
  final List<InfoItem> points;

  const ListDetailScreen({
    super.key,
    required this.title,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: AppColors.background),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: points.length,
        itemBuilder: (context, index) {
          final item = points[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border),
            ),
            child: ListTile(
              leading: const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.primary,
              ),
              title: Text(
                item.title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                '${item.subtitle} • ${item.date}',
                style: const TextStyle(color: AppColors.textSecondary),
              ),
              trailing: TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    builder: (_) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${item.date}${item.location != null ? ' • ' + item.location! : ''}',
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            item.details,
                            style: const TextStyle(height: 1.35),
                          ),
                          const SizedBox(height: 12),
                          if (item.link != null)
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Open link',
                                style: TextStyle(color: AppColors.primary),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
                child: const Text('More'),
              ),
            ),
          );
        },
      ),
    );
  }
}
