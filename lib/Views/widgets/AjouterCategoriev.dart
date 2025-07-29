import 'package:flutter/material.dart';

import 'package:flutter_application_gestion_stock/Cubits/cubit_Categorie/add_categorie_cubit/add_categorie_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_Categorie/categorie_cubit/categories_cubit.dart';

import 'package:flutter_application_gestion_stock/Models/categorie.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/textfieldformule.dart';
import 'package:flutter_application_gestion_stock/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ajoutercategoriev extends StatefulWidget {
  final bool isLoading;
  const Ajoutercategoriev({super.key, required this.isLoading});

  @override
  State<Ajoutercategoriev> createState() => _AjoutercategorievState();
}

class _AjoutercategorievState extends State<Ajoutercategoriev> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController nomCategorieController = TextEditingController();
  @override
  dispose() {
    super.dispose();
    nomCategorieController.dispose();
  }

  String? nomCategorie;

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    return BlocBuilder<AddCategorieCubit, AddCategorieState>(
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
                        controller: nomCategorieController,
                        decoration: getInputDecoration(
                          "Nom Categorie",
                          Icons.person,
                          widthScreen * 0.01,
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer le nom du Categorie';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          nomCategorie = value;
                        },
                      ),

                      SizedBox(height: widthScreen * 0.02),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            Categorie newCategorie = Categorie(
                              id_categorie:
                                  uidCategorie
                                      .v1(), // Generate a unique ID for the client

                              nom_categorie: nomCategorie,
                              Produits: [], 
                            );
                            // Add the new client to the Hive box
                            //    clientBox.add(newClient);
                            // Clear the text fields
                            nomCategorieController.clear();

                            // Optionally, you can show a success message or navigate to another screen
                            print("Categorie ajouté: ${newCategorie.toJson()}");
                            BlocProvider.of<AddCategorieCubit>(
                              context,
                            ).addCategorie(newCategorie);

                            BlocProvider.of<CategoriesCubit>(
                              context,
                            ).fetchCategories();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Categorie ajouté avec succès'),
                              ),
                            );
                            Navigator.of(context).pop();

                            print(
                              "Categorie ajoutéeeeeeeeeeeee: ${newCategorie.toJson()}",
                            );
                            setState(() {});
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                          }
                        },

                        // Add your submit logic here
                        child: Text("Ajouter"),
                      ),

                      SizedBox(height: widthScreen * 0.02),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
