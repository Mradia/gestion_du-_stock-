import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_product/add_Product_cubit/add_product_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_product/cubit_product_conditionnal/product_cubit_conditional.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_product/products_cubit/products_cubit.dart';
import 'package:flutter_application_gestion_stock/Models/Produit.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/decorationtextfield.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/formulestandaire.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/lignelisteV.dart';
import 'package:flutter_application_gestion_stock/Views/widgetsclintV/afficherimage.dart';
import 'package:flutter_application_gestion_stock/Views/widgetsclintV/container.dart';
import 'package:flutter_application_gestion_stock/Views/widgetsproduct/ajouterproductV.dart';
import 'package:flutter_application_gestion_stock/Views/widgetsproduct/imprimerPrcocher.dart';
import 'package:flutter_application_gestion_stock/Views/widgetsproduct/imprimerTTpR.dart';
import 'package:flutter_application_gestion_stock/Views/widgetsproduct/modifierProduitV.dart';
import 'package:flutter_application_gestion_stock/Views/widgetsproduct/sauvgarderExcel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Produitv extends StatefulWidget {
  const Produitv({super.key});

  @override
  State<Produitv> createState() => _ProduitvState();
}

bool select = false;

class _ProduitvState extends State<Produitv> {
  Produit? produitmodifier;
  final TextEditingController chercheController = TextEditingController();

  @override
  void dispose() {
    chercheController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final double hScreen = MediaQuery.of(context).size.height;
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
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: widthScreen * 0.05),
                  Row(
                    children: [
                      SizedBox(width: widthScreen * 0.08),
                      BlocProvider(
                        create: (context) => AddProductCubit(),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              select = true;
                            });
                            select == true
                                ? showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return BlocProvider(
                                      create: (context) => AddProductCubit(),
                                      child: BlocBuilder<
                                        AddProductCubit,
                                        AddProductState
                                      >(
                                        builder:
                                            (
                                              context,
                                              state,
                                            ) => Formulestandaire(
                                              widthScreen: widthScreen,
                                              text: "Ajouter Produit",
                                              classtype: Ajouterproductv(
                                                isLoading:
                                                    state is AddProductLoading
                                                        ? true
                                                        : false,
                                                widthScreen: widthScreen,
                                              ),
                                            ),
                                      ),
                                    );
                                  },
                                )
                                : null;
                          },
                          child: ContainerBot(
                            image: "asset/icons8-add-64.png",
                            text: "Ajouter",
                          ),
                        ),
                      ),
                      SizedBox(width: widthScreen * 0.05),

                      GestureDetector(
                        onTap: () {
                          if (produitmodifier != null) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Formulestandaire(
                                  widthScreen: widthScreen,
                                  text: "Modifier Produit",
                                  classtype: ModifierProduitV(
                                    widthScreen: widthScreen,
                                    produitModifier: produitmodifier!,
                                  ),
                                );
                              },
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Veuillez sélectionner un Produit.",
                                ),
                              ),
                            );
                          }
                        },
                        child: ContainerBot(
                          image: "asset/icons8-recycle-64.png",
                          text: "Modifier",
                        ),
                      ),
                      SizedBox(width: widthScreen * 0.04),
                      GestureDetector(
                        onTap: () {
                          if (produitmodifier != null) {
                            produitmodifier!.delete();
                            BlocProvider.of<ProductsCubit>(
                              context,
                            ).fetchProducts();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Veuillez sélectionner un Produit.",
                                ),
                              ),
                            );
                          }
                        },
                        child: ContainerBot(
                          image: "asset/icons8-close-94.png",
                          text: "Suprimer",
                        ),
                      ),
                      SizedBox(width: widthScreen * 0.04),
                      GestureDetector(
                        onTap: () {
                          if (produitmodifier != null) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Formulestandaire(
                                  widthScreen: widthScreen,
                                  text: "Afficher Image",
                                  classtype: Afficherimage(
                                    produit: produitmodifier,
                                  ),
                                );
                              },
                            );

                            BlocProvider.of<ProductsCubit>(
                              context,
                            ).fetchProducts();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Veuillez sélectionner un Produit.",
                                ),
                              ),
                            );
                          }
                        },
                        child: ContainerBot(
                          image: "asset/icons8-image-100.png",
                          text: "Afficher Image",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: widthScreen * 0.005),
                  Container(
                    margin: EdgeInsets.only(
                      left: widthScreen * 0.1,
                      right: widthScreen * 0.025,
                    ),
                    color: Colors.black,
                    height: widthScreen * 0.002,
                    width: widthScreen * 0.67,
                  ),
                  Row(
                    children: [
                      SizedBox(width: widthScreen * 0.05),
                      SizedBox(
                        height: widthScreen * 0.05,
                        width: widthScreen * 0.2,

                        child: Padding(
                          padding: EdgeInsets.all(widthScreen * 0.01),
                          child: TextFormField(
                            controller: chercheController,
                            keyboardType: TextInputType.text,

                            decoration: decorationTextfield.copyWith(
                              hintText: "          Recherche      ",
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.search),
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
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            chercheController.clear();
                          });
                        },
                        child: ContainerBot(
                          image: "asset/icons8-cloud-refresh-100.png",
                          text: "Actualiser",
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: widthScreen * 0.1,
                      right: widthScreen * 0.025,
                    ),
                    color: Colors.black,
                    height: widthScreen * 0.002,
                    width: widthScreen * 0.67,
                  ),
                  SizedBox(height: widthScreen * 0.009),
                  Lignelistev(
                    color: true,
                    listtitle: ["id", "Nom", "Quantité", "Prix", "Catégorie"],
                    colorselected: false,
                    val: widthScreen * 0.7,
                  ),

                  SizedBox(
                    height: hScreen * 0.57,
                    width: widthScreen * 0.7,

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
                          },
                          child: Lignelistev(
                            color: false,
                            listtitle: produitList,
                            colorselected:
                                produitmodifier == produit ? true : false,
                            val: widthScreen * 0.7,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: hScreen * 0.02),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (produitmodifier != null) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Formulestandaire(
                                  widthScreen: widthScreen,

                                  classtype: Imprimerprcocher(
                                    widthScreen: widthScreen,
                                    produitModifier: produitmodifier!,
                                  ),
                                );
                              },
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Veuillez sélectionner un Produit.",
                                ),
                              ),
                            );
                          }
                        },
                        child: ContainerBot(
                          image: 'asset/icons8-select-all-64.png',
                          text: "Imprimer PR cocher",
                          width: widthScreen * 0.2,
                        ),
                      ),
                      SizedBox(width: widthScreen * 0.02),
                      GestureDetector(
                        onTap: () {
                          if (produitmodifier != null) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Formulestandaire(
                                  widthScreen: widthScreen,

                                  classtype: ImprimerTTpR(
                                    produits:
                                        select == true
                                            ? produitsfltter!
                                            : produits!,
                                  ),
                                );
                              },
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Veuillez sélectionner un Produit.",
                                ),
                              ),
                            );
                          }
                        },
                        child: ContainerBot(
                          image: "asset/icons8-print-100.png",
                          text: "Imprimer toutes",
                          width: widthScreen * 0.2,
                        ),
                      ),
                      SizedBox(width: widthScreen * 0.02),
                      GestureDetector(
                        onTap: () {
                          if (produitmodifier != null) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Formulestandaire(
                                  widthScreen: widthScreen,

                                  classtype: Sauvgarderexcel(
                                    produits:
                                        select == true
                                            ? produitsfltter!
                                            : produits!,
                                  ),
                                );
                              },
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Veuillez sélectionner un Produit.",
                                ),
                              ),
                            );
                          }
                        },
                        child: ContainerBot(
                          image: "asset/icons8-excel-48.png",
                          text: "Sauvgarder dans Excel",
                          width: widthScreen * 0.2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
