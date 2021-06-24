import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';
import'package:merchandising/api/FMapi/nbl_detailsapi.dart';
import'package:merchandising/api/FMapi/outlet brand mappingapi.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';




String url = "https://rms2.rhapsody.ae/nbl_files/${mapping.pdfurl[0].toString()}";
int count;

class MyPDF extends StatefulWidget {
  @override
  _MyPDF createState() => _MyPDF();
}

class _MyPDF extends State<MyPDF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NBL PDF'),
      ),
      body: SfPdfViewer.network(
       url,
      ),
    );
  }
}


// class MyPDF extends StatefulWidget {
//   @override
//   _MyPDF createState() => _MyPDF();
// }
//
// class _MyPDF extends State<MyPDF> {
//   final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('NBL PDF'),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(
//               Icons.bookmark,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               print(mapping.pdfurl[count]);
//               // _pdfViewerKey.currentState?.openBookmarkView();
//             },
//           ),
//         ],
//       ),
//       // body:SfPdfViewer.file(File(myFile.toString())),
//
//       body:  ListView.builder(
//           shrinkWrap: true,
//           itemCount: mapping.pdfurl.length,
//           itemBuilder: (BuildContext context, int index) {
//             count=index;
//             return SfPdfViewer.network(
//               "${mapping.pdfurl[index].toString()}",
//
//               // key: _pdfViewerKey,
//             );
//           }),
//
//
//     );
//   }
// }