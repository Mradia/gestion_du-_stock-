import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_Categorie/categorie_cubit/categories_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_Categorie/getidcategorie/get_id_categorie_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_product/add_Product_cubit/add_product_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_product/products_cubit/products_cubit.dart';
import 'package:flutter_application_gestion_stock/Models/Produit.dart';
import 'package:flutter_application_gestion_stock/Models/categorie.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/textfieldformule.dart';
import 'package:flutter_application_gestion_stock/Views/widgetsproduct/dropdowncategorie.dart';
import 'package:flutter_application_gestion_stock/main.dart';
import 'package:flutter_application_gestion_stock/provider/valeur.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';

class Ajouterproductv extends StatefulWidget {
  final double? widthScreen;
  const Ajouterproductv({super.key, this.widthScreen, required bool isLoading});

  @override
  State<Ajouterproductv> createState() => _AjouterproductvState();
}

class _AjouterproductvState extends State<Ajouterproductv> {
  final TextEditingController nomProduitController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController prixProduitController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    nomProduitController.dispose();
    quantityController.dispose();
    prixProduitController.dispose();

    // Dispose of all controllers to free up resources
    // You can also call super.dispose() if you have a superclass that needs to be disposed

    super.dispose();
  }

  String? nomProduit;
  String? quantity;
  String? prixProduit;
  String? imageProduit;
  Uint8List? imageBytes;

  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    final dropdownProvider = Provider.of<DropdownValueProvider>(context);
    final double widthScreen =
        widget.widthScreen ?? MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        List<Categorie>? categories =
            BlocProvider.of<CategoriesCubit>(context).categories;

        return BlocBuilder<GetIdCategorieCubit, GetIdCategorieCubitState>(
          builder: (context, state) {
            return Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: widthScreen * 0.35,
                      width: widthScreen * 0.2,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nomProduitController,

                            decoration: getInputDecoration(
                              "Nom Produit",
                              Icons.production_quantity_limits,
                              widthScreen * 0.01,
                            ),
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer le nom du produit';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              nomProduit = value;
                            },
                          ),

                          SizedBox(height: widthScreen * 0.02),

                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: quantityController,
                            keyboardType: TextInputType.number,
                            decoration: getInputDecoration(
                              "Quantité",
                              Icons.add_circle_outline,
                              widthScreen * 0.01,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer la quantité du produit';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              quantity = value;
                            },
                          ),
                          SizedBox(height: widthScreen * 0.02),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: prixProduitController,
                            keyboardType: TextInputType.number,
                            decoration: getInputDecoration(
                              "Prix Produit",
                              Icons.attach_money,
                              widthScreen * 0.01,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer le prix du produit';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              prixProduit = value;
                            },
                          ),

                          SizedBox(height: widthScreen * 0.02),
                          SizedBox(
                            height: widthScreen * 0.05,
                            width: widthScreen * 0.16,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Categorie:",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: widthScreen * 0.01,
                                  ),
                                ),
                                SizedBox(width: widget.widthScreen! * 0.02),
                                SizedBox(
                                  child: Dropdowncategorie(
                                    width: widthScreen,
                                    height: heightScreen,
                                    categories: categories ?? [],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: widthScreen * 0.02),
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
                              SizedBox(width: widthScreen * 0.02),
                              Container(
                                color: Colors.white,
                                width: widthScreen * 0.13,
                                height: widthScreen * 0.15,
                                child:
                                    imageProduit != null
                                        ? (imageProduit!.startsWith('assets/')
                                            ? Image.asset(
                                              imageProduit!,
                                              fit: BoxFit.cover,
                                            )
                                            : (identical(
                                                  0,
                                                  0.0,
                                                ) // This is true only on web
                                                ? Image.network(
                                                  imageProduit!,
                                                  fit: BoxFit.cover,
                                                )
                                                : Image.file(
                                                  File(imageProduit!),
                                                  fit: BoxFit.cover,
                                                )))
                                        : Icon(
                                          Icons.image,
                                          size: widthScreen * 0.1,
                                          color: Colors.grey,
                                        ),
                              ),
                            ],
                          ),
                          SizedBox(height: widthScreen * 0.005),
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
                                            final pickedFile =
                                                await ImagePicker().pickImage(
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
                                          title: Text(
                                            'Choisir depuis la galerie',
                                          ),
                                          onTap: () async {
                                            Navigator.of(context).pop();
                                            if (kIsWeb) {
                                              // Utilise FilePicker pour le web
                                              FilePickerResult? result =
                                                  await FilePicker.platform
                                                      .pickFiles(
                                                type: FileType.image,
                                                withData: true,
                                              );
                                              if (result != null &&
                                                  result.files.single.bytes !=
                                                      null) {
                                                setState(() {
                                                  imageBytes =
                                                      result.files.single.bytes!;
                                                  imageProduit =
                                                      result.files.single.name;
                                                });
                                              }
                                            } else {
                                              // Utilise ImagePicker pour mobile
                                              final pickedFile =
                                                  await ImagePicker()
                                                      .pickImage(
                                                source:
                                                    ImageSource.gallery,
                                              );
                                              if (pickedFile != null) {
                                                setState(() {
                                                  imageProduit = pickedFile.path;
                                                  imageBytes = File(
                                                          pickedFile.path)
                                                      .readAsBytesSync();
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

                          SizedBox(height: widthScreen * 0.05),
                          ElevatedButton(
                            onPressed: () async {
                              BlocProvider.of<GetIdCategorieCubit>(
                                context,
                              ).fetchCategoriesfilter(
                                dropdownProvider.categorie,
                              );
                              List<Categorie>? categoriesbyId =
                                  BlocProvider.of<GetIdCategorieCubit>(
                                    context,
                                  ).categoriesGetId;

                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                Produit newProduit = Produit(
                                  id_produit: uidProduit.v1(),
                                  nom_produit: nomProduit,
                                  Quantity: int.tryParse(quantity!) ?? 0,
                                  prix_produit: double.tryParse(prixProduit!) ?? 0.0,
                                  image_produit: imageBytes, // <-- Utilise imageBytes ici !
                                  id_categorie: categoriesbyId != null && categoriesbyId.isNotEmpty
                                      ? categoriesbyId[0].id_categorie
                                      : null,
                                  list_categorie: [],
                                  list_details_commandes: [],

                                  //
                                );
                                // Add the new product to the Hive box or your backend here if needed
                                // Clear the text fields
                                nomProduitController.clear();
                                quantityController.clear();
                                prixProduitController.clear();
                                setState(() {
                                  imageProduit = null;
                                });
                                // Optionally, you can show a success message or navigate to another screen
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Produit ajouté avec succès'),
                                  ),
                                );
                                print("Produit ajouté: ${newProduit.toJson()}");
                                BlocProvider.of<AddProductCubit>(
                                  context,
                                ).addProduct(newProduit);
                                BlocProvider.of<ProductsCubit>(
                                  context,
                                ).fetchProducts(); // Refresh the product list
                                Navigator.of(context).pop();
                                setState(() {});
                              } else {
                                autovalidateMode = AutovalidateMode.always;
                              }
                            },

                            // Add your submit logic here
                            child: Text("Ajouter"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
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
