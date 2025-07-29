import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_Categorie/categorie_cubit/categories_cubit.dart';
import 'package:flutter_application_gestion_stock/Models/Produit.dart';
import 'package:flutter_application_gestion_stock/Models/categorie.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/textfieldformule.dart';
import 'package:flutter_application_gestion_stock/Views/widgetsproduct/dropdowncategorie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ModifierProduitV extends StatefulWidget {
  // This widget is used to modify a product in the application.
  // It extends StatefulWidget to allow for state management.
  final double? widthScreen;
  final double? heightScreen;
  // The width and height of the screen, used for responsive design.
  // These values are optional and can be null.

  // The product to be modified, passed as an optional parameter.
  // If null, a new product will be created.
  final Produit? produitModifier;

  const ModifierProduitV({
    super.key,
    this.widthScreen,
    this.produitModifier,
    this.heightScreen,
  });

  @override
  State<ModifierProduitV> createState() => _ModifierProduitVState();
}

class _ModifierProduitVState extends State<ModifierProduitV> {
  String? nomProduit;
  String? quantity;
  String? prixProduit;
  String? imageProduit;
  Uint8List? imageBytes;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        List<Categorie>? categories =
            BlocProvider.of<CategoriesCubit>(context).categories;

        return SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: widget.widthScreen! * 0.35,
                width: widget.widthScreen! * 0.2,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: getInputDecoration(
                        widget.produitModifier?.nom_produit ?? "Nom Produit",
                        Icons.production_quantity_limits,
                        widget.widthScreen! * 0.01,
                      ),
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        nomProduit = value;
                      },
                    ),

                    SizedBox(height: widget.widthScreen! * 0.02),

                    TextFormField(
                      style: TextStyle(color: Colors.white),

                      keyboardType: TextInputType.number,
                      decoration: getInputDecoration(
                        widget.produitModifier?.Quantity.toString() ??
                            "Quantité Produit",
                        Icons.add_circle_outline,
                        widget.widthScreen! * 0.01,
                      ),
                      onChanged: (value) {
                        quantity = value;
                      },
                    ),
                    SizedBox(height: widget.widthScreen! * 0.02),
                    TextFormField(
                      style: TextStyle(color: Colors.white),

                      keyboardType: TextInputType.number,
                      decoration: getInputDecoration(
                        widget.produitModifier?.prix_produit.toString() ??
                            "Prix Produit",
                        Icons.attach_money,
                        widget.widthScreen! * 0.01,
                      ),
                      onChanged: (value) {
                        prixProduit = value;
                      },
                    ),

                 /*   SizedBox(height: widget.widthScreen! * 0.02),
                    SizedBox(
                      height: widget.widthScreen! * 0.05,
                      width: widget.widthScreen! * 0.16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Categorie:",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: widget.widthScreen! * 0.01,
                            ),
                          ),
                          SizedBox(width: widget.widthScreen! * 0.02),
                          SizedBox(
                            child: Dropdowncategorie(
                              width: widget.widthScreen!,
                              height: widget.heightScreen!,
                              categories: categories ?? [],
                            ),
                          ),
                        ],
                      ),
                    ),*/
                  ],
                ),
              ),
              SizedBox(width: widget.widthScreen! * 0.02),
              SizedBox(
                height: widget.widthScreen! * 0.35,
                width: widget.widthScreen! * 0.2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Image:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: widget.widthScreen! * 0.01,
                          ),
                        ),
                        SizedBox(width: widget.widthScreen! * 0.02),
                         Container(
                                color: Colors.white,
                                width: widget.widthScreen! * 0.13,
                                height: widget.widthScreen! * 0.15,
                                child: imageBytes != null
                                  ? Image.memory(
                                    imageBytes!,
                                    fit: BoxFit.cover,
                                    )
                                  : (widget.produitModifier != null &&
                                      widget.produitModifier!.image_produit != null)
                                    ? (widget.produitModifier!.image_produit is Uint8List
                                      ? Image.memory(
                                        widget.produitModifier!.image_produit as Uint8List,
                                        fit: BoxFit.cover,
                                        )
                                      : widget.produitModifier!.image_produit is String
                                        ? (kIsWeb
                                          ? Image.network(
                                            widget.produitModifier!.image_produit as String,
                                            fit: BoxFit.cover,
                                            )
                                          : Image.file(
                                            File(widget.produitModifier!.image_produit as String),
                                            fit: BoxFit.cover,
                                            ))
                                        : Container())
                                    : Container(),
                                
                                )

                      ],
                    ),
                    SizedBox(height: widget.widthScreen! * 0.005),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Choisir une source'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.camera_alt),
                                    title: Text('Prendre une photo'),
                                    onTap: () async {
                                      Navigator.of(context).pop();
                                      final pickedFile = await ImagePicker()
                                          .pickImage(
                                            source: ImageSource.camera,
                                          );
                                      if (pickedFile != null) {
                                        setState(() {
                                          imageProduit = pickedFile.path;
                                        });
                                      }
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.photo_library),
                                    title: Text('Choisir depuis la galerie'),
                                    onTap: () async {
                                      Navigator.of(context).pop();
                                      if (kIsWeb) {
                                        // Utilise FilePicker pour le web
                                        FilePickerResult? result =
                                            await FilePicker.platform.pickFiles(
                                              type: FileType.image,
                                              withData: true,
                                            );
                                        if (result != null &&
                                            result.files.single.bytes != null) {
                                          setState(() {
                                            imageBytes =
                                                result.files.single.bytes!;
                                            imageProduit =
                                                result.files.single.name;
                                          });
                                        }
                                      } else {
                                        // Utilise ImagePicker pour mobile
                                        final pickedFile = await ImagePicker()
                                            .pickImage(
                                              source: ImageSource.gallery,
                                            );
                                        if (pickedFile != null) {
                                          setState(() {
                                            imageProduit = pickedFile.path;
                                            imageBytes =
                                                File(
                                                  pickedFile.path,
                                                ).readAsBytesSync();
                                          });
                                        }
                                      }
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },

                      // Add your submit logic here
                      child: Text("Parcourire.."),
                    ),

                    SizedBox(height: widget.widthScreen! * 0.05),
                    ElevatedButton(
                      onPressed:
                          widget.produitModifier == null
                              ? null
                              : () {
                                widget.produitModifier!.nom_produit =
                                    nomProduit ??
                                    widget.produitModifier!.nom_produit ??
                                    '';
                                widget.produitModifier!.Quantity =
                                    int.tryParse(quantity ?? '') ??
                                    widget.produitModifier!.Quantity ??
                                    0;
                                widget.produitModifier!.prix_produit =
                                    double.tryParse(prixProduit ?? '') ??
                                    widget.produitModifier!.prix_produit ??
                                    0.0;
                                // Pour l'image :
                                if (imageBytes != null) {
                                  widget.produitModifier!.image_produit =
                                      imageBytes;
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Produit modifié avec succès",
                                    ),
                                  ),
                                );
                                Navigator.pop(context);
                              },
                      child: Text("Modifier"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Future<void> pickImage() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.image,
    withData: true, // important for web!
  );
  if (result != null && result.files.single.bytes != null) {
    Uint8List imageBytes = result.files.single.bytes!;
    // Utilise imageBytes comme tu veux
  }
}
