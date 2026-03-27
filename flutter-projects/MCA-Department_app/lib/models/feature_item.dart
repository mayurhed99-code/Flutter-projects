import 'package:flutter/material.dart';

class FeatureItem {
  final String title;
  final String subtitle;
  final String? meta; // optional short date or summary shown on card
  final IconData icon;
  final String routeName;
  final String illustrationAsset;

  const FeatureItem({
    required this.title,
    required this.subtitle,
    this.meta,
    required this.icon,
    required this.routeName,
    required this.illustrationAsset,
  });
}
