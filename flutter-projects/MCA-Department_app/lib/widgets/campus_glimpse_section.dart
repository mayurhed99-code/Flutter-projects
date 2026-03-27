import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/dummy_data.dart';
import '../theme/app_colors.dart';

class CampusGlimpseSection extends StatefulWidget {
  const CampusGlimpseSection({super.key});

  @override
  State<CampusGlimpseSection> createState() => _CampusGlimpseSectionState();
}

class _CampusGlimpseSectionState extends State<CampusGlimpseSection> {
  static final Uri _collegeWebsite = Uri.parse('https://www.spit.ac.in/');
  final PageController _controller = PageController(viewportFraction: 0.9);
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!_controller.hasClients) return;
      final next = (_currentPage + 1) % DummyData.campusGlimpseItems.length;
      _controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 360),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  Future<void> _openWebsite() async {
    final opened = await launchUrl(
      _collegeWebsite,
      mode: LaunchMode.externalApplication,
    );
    if (opened || !mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Unable to open the website right now.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Campus Glimpse',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            TextButton.icon(
              onPressed: _openWebsite,
              icon: const Icon(Icons.public_rounded, size: 18),
              label: const Text('Visit Website'),
            ),
          ],
        ),
        SizedBox(
          height: 170,
          child: PageView.builder(
            controller: _controller,
            itemCount: DummyData.campusGlimpseItems.length,
            onPageChanged: (value) => setState(() => _currentPage = value),
            itemBuilder: (context, index) {
              final item = DummyData.campusGlimpseItems[index];
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        item.$2,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: AppColors.background,
                          alignment: Alignment.center,
                          child: const Icon(Icons.broken_image_rounded),
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              AppColors.secondary.withValues(alpha: 0.65),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 12,
                        bottom: 12,
                        child: Text(
                          item.$1,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            DummyData.campusGlimpseItems.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: _currentPage == index ? 16 : 7,
              height: 7,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? AppColors.primary
                    : AppColors.primary.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
