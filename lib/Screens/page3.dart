// Page3.dart


import 'package:flutter/material.dart';


import 'package:flutter_pdfview/flutter_pdfview.dart';
class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black87,
        title: Row(
          children: [
            // Arabic text for "Home"
            const Spacer(),
            Image.asset(
              'assets/image/preview.jpg',
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 8), // Adjust the spacing between the images
            Image.asset(
              'assets/image/preview.jpg',
              width: 32,
              height: 32,
            ),
          ],
        ),
      ),
      body: Center(
        child: PdfView(
          filePath: 'assetspdf/لائحة.pdf',
        ),
      ),
    );
  }
  
 
}

PdfView({required String filePath}) {
}
