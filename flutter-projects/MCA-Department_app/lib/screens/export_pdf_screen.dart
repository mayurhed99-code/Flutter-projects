import 'package:flutter/material.dart';
import '../utils/export_pdf.dart';

class ExportPdfScreen extends StatelessWidget {
  const ExportPdfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Export PDF')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Export a simple report as PDF'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () async {
                await exportTextAsPdf(
                  context,
                  'Sample Report',
                  'This is a simple exported report.',
                );
              },
              child: const Text('Export sample PDF'),
            ),
          ],
        ),
      ),
    );
  }
}
