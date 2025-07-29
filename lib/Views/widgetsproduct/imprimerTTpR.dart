import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_application_gestion_stock/Models/Produit.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ImprimerTTpR extends StatefulWidget {
  final List<Produit> produits;
 
  
  const ImprimerTTpR({super.key, required this.produits, });

  @override
  State<ImprimerTTpR> createState() => _ImprimerTTpRState();
}

class _ImprimerTTpRState extends State<ImprimerTTpR> {
  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
final double heightScreen = MediaQuery.of(context).size.height;

    return Container(      child: PdfPreview(
        build: (format) => _generatePdf(format, widget.produits),
      ),
    );
  }

  Future<Uint8List> _generatePdf(
      PdfPageFormat format, List<Produit> produits) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Liste des Produits',
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  )),
              pw.SizedBox(height: 20),
              pw.Table.fromTextArray(
                headers: ['ID', 'Nom', 'Quantité', 'Prix'],
                data: produits
                    .map((produit) => [
                          produit.id_produit.toString(),
                          produit.nom_produit ?? '',
                          produit.Quantity.toString(),
                          produit.prix_produit.toString(),
                        ])
                    .toList(),
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}
