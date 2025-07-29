import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_Categorie/add_categorie_cubit/add_categorie_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_Categorie/categorie_cubit/categories_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_Categorie/cubit_categorie_conditionnal/categorie_cubit_conditional.dart';

import 'package:flutter_application_gestion_stock/Models/categorie.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/AjouterCategoriev.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/ModifierCategoriv.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/decorationtextfield.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/formulestandaire.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/lignelisteV.dart';
import 'package:flutter_application_gestion_stock/Views/widgetsclintV/container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categoriev extends StatefulWidget {
  const Categoriev({super.key});

  @override
  State<Categoriev> createState() => _CategorievState();
}

class _CategorievState extends State<Categoriev> {
  bool? select;
  final TextEditingController chercheController = TextEditingController();

  @override
  void dispose() {
    chercheController.dispose();
    super.dispose();
  }

  Categorie? categoriemodifier;

  @override
  Widget build(BuildContext context) {
    select = false;
    final double widthScreen = MediaQuery.of(context).size.width;
    final double hScreen = MediaQuery.of(context).size.height;
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        List<Categorie>? categories =
            BlocProvider.of<CategoriesCubit>(context).categories;
        return BlocBuilder<
          CategorieCubitConditional,
          CategorieCubitConditionalState
        >(
          builder: (context, state) {
            List<Categorie>? categoriesfilters =
                BlocProvider.of<CategorieCubitConditional>(
                  context,
                ).categoriesfltter;
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: widthScreen * 0.05),
                  Row(
                    children: [
                      BlocProvider(
                        create: (context) => AddCategorieCubit(),
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
                                      create: (context) => AddCategorieCubit(),
                                      child: BlocBuilder<
                                        AddCategorieCubit,
                                        AddCategorieState
                                      >(
                                        builder:
                                            (
                                              context,
                                              state,
                                            ) => Formulestandaire(
                                              widthScreen: widthScreen,
                                              text: "Ajouter Client",
                                              classtype: Ajoutercategoriev(
                                                isLoading:
                                                    state is AddCategorieLoading
                                                        ? true
                                                        : false,
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

                      SizedBox(width: widthScreen * 0.04),
                      GestureDetector(
                        onTap: () {
                          if (categoriemodifier != null) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Formulestandaire(
                                  widthScreen: widthScreen,
                                  text: "Modifier Categorie",
                                  classtype: ModifierCategoriv(
                                    widthScreen: widthScreen,
                                    newCategorie: categoriemodifier!,
                                  ),
                                );
                              },
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Veuillez sélectionner un client.",
                                ),
                              ),
                            );
                          }
                          setState(() {});
                        },
                        child: ContainerBot(
                          image: "asset/icons8-recycle-64.png",
                          text: "Modifier",
                        ),
                      ),
                      SizedBox(width: widthScreen * 0.04),

                      GestureDetector(
                        onTap: () {
                          if (categoriemodifier != null) {
                            categoriemodifier!.delete();
                            BlocProvider.of<CategoriesCubit>(
                              context,
                            ).fetchCategories();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Veuillez sélectionner un categorie.",
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
                      SizedBox(width: widthScreen * 0.03),
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
                            onChanged:
                                (value) =>
                                    BlocProvider.of<CategorieCubitConditional>(
                                      context,
                                    ).fetchCategoriesfilter(value),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: widthScreen * 0.005),
                  Container(
                    margin: EdgeInsets.only(
                      left: widthScreen * 0.06,
                      right: widthScreen * 0.035,
                    ),
                    color: Colors.black,
                    height: widthScreen * 0.002,
                    width: widthScreen * 0.66,
                  ),

                  SizedBox(height: widthScreen * 0.005),

                  Lignelistev(
                    color: true,
                    listtitle: ["id", "NomCategorie"],
                    colorselected: false,
                    val: widthScreen * 0.7,
                  ),

                  SizedBox(
                    height: hScreen * 0.60,
                    width: widthScreen * 0.7,

                    child: ListView.builder(
                      itemCount:
                          chercheController.text.isEmpty
                              ? categories?.length ?? 0
                              : categoriesfilters?.length ?? 0,
                      itemBuilder: (context, index) {
                        final categorie =
                            chercheController.text.isEmpty
                                ? categories![index]
                                : categoriesfilters![index];
                        List categorieList = [
                          categorie.id_categorie.toString(),
                          categorie.nom_categorie ?? '',
                        ];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              select = !select!;
                              categoriemodifier = categorie;
                            });
                          },
                          child: Lignelistev(
                            color: false,
                            listtitle: categorieList,
                            colorselected:
                                categoriemodifier == categorie ? true : false,
                            val: widthScreen * 0.7,
                          ),
                        );
                      },
                    ),
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
