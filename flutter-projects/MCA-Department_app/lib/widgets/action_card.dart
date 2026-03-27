import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/feature_item.dart';
import '../theme/app_colors.dart';

class ActionCard extends StatelessWidget {
  final FeatureItem item;
  final VoidCallback onTap;

  const ActionCard({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border),
            boxShadow: const [
              BoxShadow(
                color: Color(0x101E2A38),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final compact = constraints.maxHeight < 150;
              final imageHeight = compact ? 54.0 : 68.0;
              final imageWidth = compact ? 72.0 : 88.0;
              final iconSize = compact ? 36.0 : 42.0;
              final topGap = compact ? 8.0 : 14.0;
              final lineCount = compact ? 2 : 3;

              return Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: imageHeight,
                          width: imageWidth,
                          color: Colors.white,
                          padding: const EdgeInsets.all(6),
                          child: SvgPicture.asset(
                            item.illustrationAsset,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: iconSize,
                              width: iconSize,
                              decoration: BoxDecoration(
                                color: const Color(0x1AC5A100),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                item.icon,
                                color: AppColors.secondary,
                                size: 20,
                              ),
                            ),
                            SizedBox(width: imageWidth + 8),
                          ],
                        ),
                        SizedBox(height: topGap),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                            if (item.meta != null) ...[
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5F5F7),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: AppColors.border),
                                ),
                                child: Text(
                                  item.meta!,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 4),
                        Expanded(
                          child: Text(
                            item.subtitle,
                            maxLines: lineCount,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              height: 1.3,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                        Container(
                          height: 4,
                          width: 44,
                          decoration: BoxDecoration(
                            color: const Color(0xFFC5A100),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
