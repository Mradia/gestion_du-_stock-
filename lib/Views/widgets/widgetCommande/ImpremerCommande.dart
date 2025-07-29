import 'package:flutter/material.dart';
// Requis pour charger la police
import 'package:flutter_application_gestion_stock/Cubits/cubit_client/cubit_getClientbyid_conditionnal/clientbyid_cubit_conditional.dart';
// Assurez-vous d'importer le fichier d'état
import 'package:flutter_application_gestion_stock/Models/client.dart';
import 'package:flutter_application_gestion_stock/Models/commande.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart'
    as pw; // L'alias 'pw' est pour la bibliothèque PDF
import 'package:printing/printing.dart';

class Impremercommande extends StatefulWidget {
  final Commande? commande;
  const Impremercommande({super.key, required this.commande});

  @override
  State<Impremercommande> createState() => _ImpremercommandeState();
}

class _ImpremercommandeState extends State<Impremercommande> {
  List<Client>? clientidfilters2;
  @override
  void initState() {
    super.initState();
    // CORRECTION : On demande les données ici, mais on ne les assigne pas directement.
    // Le BlocBuilder s'en chargera.

    BlocProvider.of<ClientidCubitConditional>(
      context,
    ).fetchClientidfilter(widget.commande?.id_client ?? '');
    setState(() {
      clientidfilters2 =
          BlocProvider.of<ClientidCubitConditional>(context).clientsidfltter;
    });
  }

  @override
  Widget build(BuildContext context) {
    // CORRECTION : Utilisation de BlocBuilder pour gérer les états (chargement, succès, erreur)
    return BlocBuilder<ClientidCubitConditional, ClientidCubitConditionalState>(
      builder: (context, state) {
        // État de chargement
        if (state is ClientidCubitConditionalInitial) {
          return const Center(child: CircularProgressIndicator());
        }

        // État de succès, les données sont prêtes
        if (state is ClientidCubitConditionalSuccess) {
          // On récupère le client depuis l'état du Bloc
          final Client? client =
              clientidfilters2?[clientidfilters2!.length - 1];

          return Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.print),
              label: const Text('Imprimer la Facture'),
              onPressed: () {
                // On appelle la fonction de génération de PDF avec les bonnes données
                _generateAndPrintPdf(widget.commande!, client);
              },
            ),
          );
        }

        // État initial ou par défaut
        return const Center(child: Text("Veuillez patienter..."));
      },
    );
  }

  /// Fonction séparée pour générer et imprimer le PDF
  Future<void> _generateAndPrintPdf(Commande commande, Client? client) async {
    final pdf = pw.Document();

    // CORRECTION : Chargement d'une police supportant les caractères spéciaux (français, arabe)
    // Assurez-vous d'avoir un fichier de police (ex: NotoSans-Regular.ttf) dans 'assets/fonts/'
    // et de l'avoir déclaré dans pubspec.yaml
    // final font = await PdfGoogleFonts.noto Sans();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        // CORRECTION : Appliquer la police à toute la page
        //  theme: pw.ThemeData.withFont(base: font),
        build: (pw.Context context) {
          return pw.Padding(
            // CORRECTION : Utilisation de pw.EdgeInsets
            padding: const pw.EdgeInsets.all(30.0),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'Facture',
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Client: ${client?.name_client ?? ''} ${client?.Prenom_client ?? ''}',
                        ),
                        pw.Text(
                          'Adresse: ${client?.address_client ?? ''}, ${client?.ville_client ?? ''}',
                        ),
                        pw.Text('Email: ${client?.email_client ?? ''}'),
                        pw.Text('Téléphone: ${client?.phone_client ?? ''}'),
                      ],
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Commande ID: ${commande.id_commande ?? ''}'),
                        pw.Text('Date: ${commande.date_commande ?? ''}'),
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(height: 40),
                // Utilisation de pw.Table.fromTextArray pour plus de simplicité
                pw.Table.fromTextArray(
                  headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  headerDecoration: const pw.BoxDecoration(
                    color: PdfColors.grey300,
                  ),
                  cellHeight: 30,
                  cellAlignments: {
                    0: pw.Alignment.centerLeft,
                    1: pw.Alignment.centerRight,
                    2: pw.Alignment.centerRight,
                    3: pw.Alignment.centerRight,
                  },
                  headers: ['Produit', 'Quantité', 'Prix Unitaire', 'Total'],
                  data:
                      (commande.list_details_commande ?? [])
                          .map(
                            (detail) => [
                              detail.id_produit ?? '',
                              detail.quantity.toString(),
                              '${detail.prix?.toStringAsFixed(2) ?? '0.00'} DA',
                              (detail.quantity! * detail.prix!).toStringAsFixed(
                                2,
                              ),
                            ],
                          )
                          .toList(),
                ),
                pw.Spacer(), // Pousse le contenu suivant vers le bas
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text(
                          'Total HT: ${commande.total_Ht?.toStringAsFixed(2) ?? '0.00'} DA',
                        ),
                        pw.Text(
                          'TVA (${commande.tVA}%): ${((commande.total_Ht ?? 0) * (commande.tVA ?? 0) / 100).toStringAsFixed(2)} DA',
                        ),
                        pw.Divider(),
                        pw.Text(
                          'Total TTC: ${commande.total_TTC?.toStringAsFixed(2) ?? '0.00'} DA',
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );

    // Afficher l'écran de prévisualisation et d'impression
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
