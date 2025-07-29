import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Models/Produit.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class Imprimerprcocher extends StatefulWidget {
  final Produit? produitModifier;
  final double? widthScreen;
  const Imprimerprcocher({super.key, this.produitModifier, this.widthScreen});

  @override
  State<Imprimerprcocher> createState() => _ImprimerprcocherState();
}

class _ImprimerprcocherState extends State<Imprimerprcocher> {
  @override
  Widget build(BuildContext context) {
    if (widget.produitModifier == null) {
      return const Center(
        child: Text(
          "Aucun produit sélectionné.",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Aperçu du produit à imprimer",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 20),
          _buildInfoRow("Nom du produit:", widget.produitModifier!.nom_produit),
          _buildInfoRow(
              "Quantité:", widget.produitModifier!.Quantity.toString()),
          _buildInfoRow("Prix:",
              "${widget.produitModifier!.prix_produit?.toStringAsFixed(2) ?? 'N/A'} €"),
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.picture_as_pdf),
              label: const Text("Générer le PDF"),
              onPressed: () => _createPdf(context, widget.produitModifier!),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value ?? 'Non défini',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _createPdf(BuildContext context, Produit produit) async {
    final pdf = pw.Document();

    Uint8List? imageBytes;
    if (produit.image_produit != null) {
      if (produit.image_produit is Uint8List) {
        imageBytes = produit.image_produit as Uint8List;
      } else if (produit.image_produit is String) {
        if (!kIsWeb) {
          final file = File(produit.image_produit as String);
          if (await file.exists()) {
            imageBytes = await file.readAsBytes();
          }
        }
      }
    }

    final image = imageBytes != null ? pw.MemoryImage(imageBytes) : null;

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Header(
                level: 0,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Fiche Produit',
                        style: pw.TextStyle(
                            fontSize: 24, fontWeight: pw.FontWeight.bold)),
                    pw.Text(DateFormat('dd/MM/yyyy').format(DateTime.now())),
                  ],
                ),
              ),
              pw.Divider(),
              pw.SizedBox(height: 20),
              if (image != null)
                pw.Center(
                  child: pw.Container(
                    height: 200,
                    child: pw.Image(image),
                  ),
                ),
              if (image != null) pw.SizedBox(height: 30),
              _buildPdfInfoRow('Nom du produit:', produit.nom_produit ?? 'N/A'),
              _buildPdfInfoRow(
                  'Quantité en stock:', produit.Quantity?.toString() ?? 'N/A'),
              _buildPdfInfoRow('Prix unitaire:',
                  "${produit.prix_produit?.toStringAsFixed(2) ?? 'N/A'} €"),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  pw.Widget _buildPdfInfoRow(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 8.0),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(
            width: 150,
            child: pw.Text(
              label,
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14),
            ),
          ),
          pw.Expanded(
            child: pw.Text(
              value,
              style: const pw.TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}