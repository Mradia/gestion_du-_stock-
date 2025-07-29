import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_details_commandes/add_DetailsCommades_cubit/add_detailsCommades_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_product/cubit_product_conditionnal/product_cubit_conditional.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_product/products_cubit/products_cubit.dart';
import 'package:flutter_application_gestion_stock/Models/Produit.dart';

import 'package:flutter_application_gestion_stock/Views/widgets/decorationtextfield.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/lignelisteV.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/widgetCommande/ajouterdetailsCommande.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Containerproduit extends StatefulWidget {

  final String? id_Commende;
  final bool isLoading;
  const Containerproduit({super.key, required this.isLoading,required this.id_Commende,});

  @override
  State<Containerproduit> createState() => _ContainerproduitState();
}

class _ContainerproduitState extends State<Containerproduit> {
  final TextEditingController chercheController = TextEditingController();

  Produit? produitmodifier;
  @override
  bool select = false;
  @override
  void dispose() {
    chercheController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        List<Produit>? produits =
            BlocProvider.of<ProductsCubit>(context).products;
        return BlocBuilder<
          ProductCubitConditional,
          ProductCubitConditionalState
        >(
          builder: (context, state) {
            List<Produit>? produitsfltter =
                BlocProvider.of<ProductCubitConditional>(
                  context,
                ).produitsfltter;
            return Container(
              alignment: Alignment.topLeft,

              height: heightScreen * 0.8,
              width: widthScreen * 0.25,
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
                              "Produit",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: widthScreen * 0.02,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: heightScreen * 0.01),
                            SizedBox(
                              height: widthScreen * 0.04,
                              width: widthScreen * 0.15,

                              child: Padding(
                                padding: EdgeInsets.all(widthScreen * 0.01),
                                child: TextFormField(
                                  controller: chercheController,
                                  keyboardType: TextInputType.text,

                                  decoration: decorationTextfield.copyWith(
                                    hintText: "          Recherche      ",
                                    suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.search,
                                        size: widthScreen * 0.01,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    BlocProvider.of<ProductCubitConditional>(
                                      context,
                                    ).fetchProduitsfilter(value);
                                  },
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: widthScreen * 0.02,
                                right: widthScreen * 0.025,
                              ),
                              color: Colors.white,
                              height: widthScreen * 0.002,
                              width: widthScreen * 0.8,
                            ),
                            SizedBox(height: heightScreen * 0.01),
                            Lignelistev(
                              color: true,
                              listtitle: [
                                "id",
                                "Nom",
                                "Quantité",
                                "Prix",
                                "Catégorie",
                              ],
                              colorselected: false,
                              val: widthScreen * 0.47,
                            ),
                            SizedBox(
                              height: heightScreen * 0.60,
                              width: widthScreen * 0.25,

                              child: ListView.builder(
                                itemCount:
                                    chercheController.text.isEmpty
                                        ? produits?.length ?? 0
                                        : produitsfltter?.length ?? 0,
                                itemBuilder: (context, index) {
                                  final produit =
                                      chercheController.text.isEmpty
                                          ? produits![index]
                                          : produitsfltter![index];
                                  List produitList = [
                                    produit.id_produit.toString(),
                                    produit.nom_produit ?? '',
                                    produit.Quantity.toString(),
                                    produit.prix_produit.toString(),
                                    produit.id_categorie != null ? "1" : "0",
                                  ];
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        select = !select!;
                                        produitmodifier = produit;
                                      });
                                      showDialog(
                                        context: context,
                                        builder:
                                            (context) => AlertDialog(
                                              title: Container(
                                                color: Colors.white,
                                                width: widthScreen * 0.25,
                                                height: heightScreen * 0.05,

                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                    widthScreen * 0.006,
                                                  ),
                                                  child: Text(
                                                    'Produit',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize:
                                                          widthScreen * 0.01,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              content: BlocBuilder<
                                                AddDetailsCommadesCubit,
                                                AddDetailsCommadesState
                                              >(
                                                builder: (context, state) {
                                                  return Ajouterdetailscommande(
                                                    isLoading: widget.isLoading,
                                                    produitchoiser:
                                                        produitmodifier,
                                                    id_commande:
                                                        widget.id_Commende,
                                                    
                                                  );
                                                },
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed:
                                                      () =>
                                                          Navigator.of(
                                                            context,
                                                          ).pop(),
                                                  child: Text('OK'),
                                                ),
                                              ],
                                              backgroundColor: Colors.black54,
                                            ),
                                      );
                                    },
                                    child: Lignelistev(
                                      color: false,
                                      listtitle: produitList,
                                      colorselected:
                                          produitmodifier == produit
                                              ? true
                                              : false,
                                      val: widthScreen * 0.47,
                                    ),
                                  );
                                },
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
