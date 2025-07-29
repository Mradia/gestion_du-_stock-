import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_gestion_stock/Models/categorie.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/textfieldformule.dart';

class ModifierCategoriv extends StatefulWidget {
  final double widthScreen;
   final Categorie newCategorie;
  const ModifierCategoriv({super.key, required this.widthScreen, required this.newCategorie});

  @override
  State<ModifierCategoriv> createState() => _ModifierCategorivState();
}

class _ModifierCategorivState extends State<ModifierCategoriv> {
  String? nomcategorie;
  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: widget.widthScreen * 0.35,
        width: widget.widthScreen * 0.2,
        child: Column(
          children: [
       TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: getInputDecoration(
                widget.newCategorie.nom_categorie ?? "Nom Categorie",
                Icons.category,
                widget.widthScreen * 0.01,
              ),
              onChanged: (value) {
                nomcategorie = value;
              },
            ),
                SizedBox(width: widget.widthScreen * 0.02),
            ElevatedButton(
              onPressed: () {
                widget.newCategorie.nom_categorie =
                    nomcategorie ?? widget.newCategorie.nom_categorie;
                // Add your save logic for Categorie here, for example:
                // widget.newCategorie.save();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Catégorie modifiée avec succès")),
                );
                Navigator.pop(context);
              },
      
              // Add your submit logic here
              child: Text("Modifier"),
            ),
          ],
        ),
      ),
    );
  }
}
