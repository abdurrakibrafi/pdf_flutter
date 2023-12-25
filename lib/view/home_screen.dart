import 'package:flutter/material.dart';
import 'package:pdf_flutter/model/product_model.dart';
import 'package:pdf_flutter/view/pdf_invoice_services.dart';
import 'package:printing/printing.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Flutter PDF Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: PdfPreview(
                        build: (context) => generatePdf(),
                      ),
                    );
                  },
                );
              },
              child: Text('Generate PDF'),
            ),
          ),
        ],
      ),
    );
  }
}
