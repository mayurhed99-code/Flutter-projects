import 'package:flutter/material.dart';

import '../../data/dummy_data.dart';
import '../../widgets/action_card.dart';

class NoticesTabScreen extends StatelessWidget {
  const NoticesTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 760;
        return GridView.builder(
          itemCount: DummyData.noticeItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isWide ? 2 : 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: isWide ? 2.2 : 1.9,
          ),
          itemBuilder: (_, index) {
            final item = DummyData.noticeItems[index];
            return ActionCard(
              item: item,
              onTap: () => Navigator.pushNamed(context, item.routeName),
            );
          },
        );
      },
    );
  }
}
