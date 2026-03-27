import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<void> exportTextAsPdf(
  BuildContext context,
  String title,
  String content,
) async {
  final doc = pw.Document();
  doc.addPage(
    pw.Page(
      build: (pw.Context ctx) {
        return pw.Column(
          children: [
            pw.Text(title, style: pw.TextStyle(fontSize: 20)),
            pw.SizedBox(height: 12),
            pw.Text(content),
          ],
        );
      },
    ),
  );

  final bytes = await doc.save();
  await Printing.layoutPdf(onLayout: (format) => Future.value(bytes));
}
