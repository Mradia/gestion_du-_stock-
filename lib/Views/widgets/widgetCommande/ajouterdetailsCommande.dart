import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_Commande/add_Commande_cubit/add_Commande_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_details_commandes/add_DetailsCommades_cubit/add_detailsCommades_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_details_commandes/cubit_DetailsCommades_conditionnal/detailsCommades_cubit_conditional.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_details_commandes/detailsCommades_cubit/detailsCommades_cubit.dart';
import 'package:flutter_application_gestion_stock/Models/Produit.dart';
import 'package:flutter_application_gestion_stock/Models/client.dart';
import 'package:flutter_application_gestion_stock/Models/details_commades.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/ajouterCommandeV.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/formulestandaire.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/widgetCommande/paddingdetailscommande.dart';
import 'package:flutter_application_gestion_stock/main.dart';
import 'package:flutter_application_gestion_stock/provider/clientprovider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Ajouterdetailscommande extends StatefulWidget {
  final String? id_commande;
  final Produit? produitchoiser;
  final bool isLoading;

  const Ajouterdetailscommande({
    super.key,
    required this.isLoading,
    required this.produitchoiser,
    required this.id_commande,
  });

  @override
  State<Ajouterdetailscommande> createState() => _AjouterdetailscommandeState();
}

class _AjouterdetailscommandeState extends State<Ajouterdetailscommande> {
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController remiseController = TextEditingController();
  final TextEditingController tvaController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? quantity; // Added to store the quantity value
  String? remise; // Added to store the remise value
  double? total; // Added to store the total value
  @override
  void dispose() {
    // TODO: implement dispose
    quantityController.dispose();
    remiseController.dispose();
    tvaController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  late double tOTAL_TTC;
  double tOTAL_HT = 0;
  @override
  Widget build(BuildContext context) {
    final clientProvider = Provider.of<ClientValueProvider>(context);
    final double widthScreen = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;
    return BlocBuilder<
      DetailsCommadesCubitConditional,
      DetailsCommadesCubitConditionalState
    >(
      builder: (context, state) {
        List<DetailsCommades>? detailsCommadesfilters =
            BlocProvider.of<DetailsCommadesCubitConditional>(
              context,
            ).detailsCommadesfltter;
        return BlocBuilder<AddDetailsCommadesCubit, AddDetailsCommadesState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(
                left: widthScreen * 0.01,
                top: heightScreen * 0.01,
              ),
              alignment: Alignment.topLeft,
              height: heightScreen * 0.6,
              width: widthScreen * 0.4,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child:
                  widget.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: heightScreen * 0.01),
                            Text(
                              "Vendre Produit",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: widthScreen * 0.012,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.all(widthScreen * 0.01),

                                  height: heightScreen * 0.5,
                                  width: widthScreen * 0.2,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      paddingDetailsCommande(
                                        widthScreen: widthScreen,
                                        heightScreen: heightScreen,
                                        produitchoiser:
                                            widget.produitchoiser!.id_produit,
                                        title: " Id  : ",
                                      ),
                                      paddingDetailsCommande(
                                        widthScreen: widthScreen,
                                        heightScreen: heightScreen,
                                        produitchoiser:
                                            widget.produitchoiser!.nom_produit,
                                        title: " Nom  : ",
                                      ),
                                      paddingDetailsCommande(
                                        widthScreen: widthScreen,
                                        heightScreen: heightScreen,
                                        produitchoiser:
                                            widget.produitchoiser!.Quantity
                                                .toString(),
                                        title: " Stock  : ",
                                      ),
                                      paddingDetailsCommande(
                                        widthScreen: widthScreen,
                                        heightScreen: heightScreen,
                                        produitchoiser:
                                            "${widget.produitchoiser!.prix_produit} DA",
                                        title: " Prix  : ",
                                      ),
                                    ],
                                  ),
                                ),

                                Form(
                                  key: formKey,
                                  autovalidateMode: autovalidateMode,
                                  child: SizedBox(
                                    width: widthScreen * 0.15,

                                    height: heightScreen * 0.5,
                                    child: Column(
                                      children: [
                                        SizedBox(height: heightScreen * 0.01),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: widthScreen * 0.01,
                                          ),
                                          child: Text(
                                            "Quantité   ",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: widthScreen * 0.010,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: heightScreen * 0.01),
                                        Padding(
                                          padding: EdgeInsets.all(
                                            widthScreen * 0.01,
                                          ),
                                          child: SizedBox(
                                            width: widthScreen * 0.12,
                                            height: heightScreen * 0.05,
                                            child: TextFormField(
                                              controller: quantityController,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: widthScreen * 0.01,
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                hintText: "Entrez la quantité",
                                                hintStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: widthScreen * 0.01,
                                                ),

                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        8.0,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Veuillez entrer la quantité';
                                                }
                                                return null;
                                              },
                                              onSaved: (value) {
                                                quantity = value;
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: heightScreen * 0.01),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: widthScreen * 0.01,
                                          ),
                                          child: Text(
                                            "TVA   ",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: widthScreen * 0.010,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),

                                        SizedBox(height: heightScreen * 0.01),
                                        Padding(
                                          padding: EdgeInsets.all(
                                            widthScreen * 0.01,
                                          ),
                                          child: SizedBox(
                                            width: widthScreen * 0.12,
                                            height: heightScreen * 0.05,
                                            child: TextField(
                                              controller: tvaController,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: widthScreen * 0.01,
                                              ),

                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                hintText: "Entrez le TVA",

                                                hintStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: widthScreen * 0.01,
                                                ),

                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        8.0,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: heightScreen * 0.01),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: widthScreen * 0.01,
                                          ),
                                          child: Text(
                                            "Remise  ",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: widthScreen * 0.010,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),

                                        SizedBox(height: heightScreen * 0.01),
                                        Padding(
                                          padding: EdgeInsets.all(
                                            widthScreen * 0.01,
                                          ),
                                          child: SizedBox(
                                            width: widthScreen * 0.12,
                                            height: heightScreen * 0.05,
                                            child: TextField(
                                              controller: remiseController,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: widthScreen * 0.01,
                                              ),

                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                hintText: "Entrez la Remise",

                                                hintStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: widthScreen * 0.01,
                                                ),

                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        8.0,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: heightScreen * 0.01),

                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: widthScreen * 0.02,
                                              vertical: heightScreen * 0.01,
                                            ),
                                          ),
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              formKey.currentState!.save();

                                              // Vérifie que les champs nécessaires ne sont pas null
                                              if (quantity == null ||
                                                  remiseController
                                                      .text
                                                      .isEmpty ||
                                                  widget.produitchoiser ==
                                                      null ||
                                                  widget
                                                          .produitchoiser!
                                                          .prix_produit ==
                                                      null) {
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                      'Veuillez remplir tous les champs',
                                                    ),
                                                  ),
                                                );
                                                return;
                                              }

                                              // Calcul du total sécurisé
                                              final prixProduit =
                                                  widget
                                                      .produitchoiser!
                                                      .prix_produit ??
                                                  0.0;
                                              final qte =
                                                  int.tryParse(quantity!) ?? 0;
                                              final remiseValue =
                                                  double.tryParse(
                                                    remiseController.text,
                                                  ) ??
                                                  1.0;
                                              double newremise = remiseValue;
                                              if (remiseValue > 100) {
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                      'Remise doit être entre 0 et 100',
                                                    ),
                                                  ),
                                                );
                                                return;
                                              }
                                              if (remiseValue >= 1) {
                                                newremise = remiseValue / 100;
                                              }

                                              final totalValue =
                                                  prixProduit *
                                                  qte *
                                                  (1 - newremise);

                                              DetailsCommades
                                              newDetailsCommades =
                                                  DetailsCommades(
                                                    id_Details_commande:
                                                        uidDetailsCommades.v1(),
                                                    id_commande:
                                                        widget.id_commande,
                                                    id_produit:
                                                        widget
                                                            .produitchoiser!
                                                            .id_produit,
                                                    nom_produit:
                                                        widget
                                                            .produitchoiser!
                                                            .nom_produit,
                                                    quantity: qte,
                                                    prix: prixProduit,
                                                    remise: remiseValue,
                                                    total: totalValue,
                                                    list_produit: [],
                                                    list_commandes: [],
                                                  );

                                              quantityController.clear();
                                              remiseController.clear();

                                              BlocProvider.of<
                                                AddDetailsCommadesCubit
                                              >(context).addDetailsCommades(
                                                newDetailsCommades,
                                              );
                                              BlocProvider.of<
                                                DetailsCommadesCubitConditional
                                              >(context).detailsCommadesfltter;
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    'DetailsCommades ajouté avec succès',
                                                  ),
                                                ),
                                              );
                                              setState(() {
                                                clientProvider.tVa =
                                                    double.tryParse(
                                                      tvaController.text,
                                                    ) ??
                                                    0.0;
                                              });
                                              tvaController.clear();

                                              showDialog(
                                                context: context,
                                                builder: (
                                                  BuildContext context,
                                                ) {
                                                  return BlocProvider(
                                                    create:
                                                        (context) =>
                                                            AddCommandeCubit(),
                                                    child: BlocBuilder<
                                                      AddCommandeCubit,
                                                      AddCommandeState
                                                    >(
                                                      builder:
                                                          (
                                                            context,
                                                            state,
                                                          ) => Formulestandaire(
                                                            widthScreen:
                                                                widthScreen /
                                                                0.7,
                                                            text:
                                                                "Ajouter Commande",
                                                            classtype: AjouterCommandeV(
                                                              isLoading:
                                                                  state
                                                                          is AddCommandeLoading
                                                                      ? true
                                                                      : false,
                                                              clientmodifier:
                                                                  clientProvider
                                                                      .clientValue,

                                                              id_Commende:
                                                                  clientProvider
                                                                      .idCommandeValue,
                                                            ),
                                                          ),
                                                    ),
                                                  );
                                                },
                                              );
                                            } else {
                                              setState(() {
                                                autovalidateMode =
                                                    AutovalidateMode.always;
                                              });
                                            }
                                          },

                                          // Add your submit logic here
                                          child: Text(
                                            "Enregistrer",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: widthScreen * 0.01,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),

                                        SizedBox(height: widthScreen * 0.02),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // Add your product list here
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
