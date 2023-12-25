import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<Uint8List> generatePdf() async {
  final pdf = pw.Document();
  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text(
            "This is a sample pdf generated in Flutter",
            style: const pw.TextStyle(
              fontSize: 25,
            ),
          ),
        ); // Center
      }));

  var image = await networkImage('https://picsum.photos/250?image=9');
  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Image(image),
        ); // Center
      }));

  return pdf.save();
}
