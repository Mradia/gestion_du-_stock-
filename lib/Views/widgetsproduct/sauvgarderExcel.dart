import 'package:flutter/widgets.dart';
import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Models/Produit.dart';
// For web, we can use universal_html to save the file.
// For mobile, you might need path_provider and open_file.
import 'package:universal_html/html.dart' as html;

class Sauvgarderexcel extends StatefulWidget {
  final List<Produit> produits;
  const Sauvgarderexcel({super.key, required this.produits});

  @override
  State<Sauvgarderexcel> createState() => _SauvgarderexcelState();
}

class _SauvgarderexcelState extends State<Sauvgarderexcel> {
  bool _isLoading = false;

  Future<void> _generateAndSaveExcel() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final excel = Excel.createExcel();
      final Sheet sheet = excel[excel.getDefaultSheet()!];

      // Add headers
      sheet.appendRow([
        TextCellValue('ID'),
        TextCellValue('Nom'),
        TextCellValue('Quantité'),
        TextCellValue('Prix'),
      ]);

      // Add data
      for (final produit in widget.produits) {
        sheet.appendRow([
          TextCellValue(produit.id_produit ?? ''),
          TextCellValue(produit.nom_produit ?? ''),
          IntCellValue(produit.Quantity ?? 0),
          DoubleCellValue(produit.prix_produit ?? 0.0),
        ]);
      }

      // Save the file
      final fileBytes = excel.save();

      if (fileBytes != null) {
        if (kIsWeb) {
          final blob = html.Blob([fileBytes], 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
          final url = html.Url.createObjectUrlFromBlob(blob);
          final anchor = html.document.createElement('a') as html.AnchorElement
            ..href = url
            ..style.display = 'none'
            ..download = 'produits.xlsx';
          html.document.body!.children.add(anchor);
          anchor.click();
          html.document.body!.children.remove(anchor);
          html.Url.revokeObjectUrl(url);
          if (mounted) Navigator.of(context).pop(); // Close the dialog on success
        } else {
          // Mobile implementation would go here.
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Exportation non supportée sur cette plateforme.')),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la génération du fichier Excel: $e')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
final double heightScreen = MediaQuery.of(context).size.height;

   
    return Center(
      child: _isLoading
          ? const CircularProgressIndicator()
          : ElevatedButton.icon(
              icon: const Icon(Icons.download),
              label: const Text('Télécharger le fichier Excel'),
              onPressed: _generateAndSaveExcel,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
    );
  }
}  