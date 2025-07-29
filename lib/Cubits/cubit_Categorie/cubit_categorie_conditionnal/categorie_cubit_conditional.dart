import 'package:flutter_application_gestion_stock/Models/categorie.dart';

import 'package:flutter_application_gestion_stock/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';


part 'categorie_cubit_conditional_state.dart';

class CategorieCubitConditional extends Cubit<CategorieCubitConditionalState> {
  CategorieCubitConditional() : super(CategorieCubitConditionalInitial());

  // You can add methods here to manage the state of client conditions
  // For example, checking if a client meets certain conditions, etc.
  
 List<Categorie>? categoriesfltter ;
  void fetchCategoriesfilter(String text) {
    var categorieBox = Hive.box<Categorie>(kCategorieBox);
    categoriesfltter = categorieBox.values
        .where((categorie) => categorie.nom_categorie == text)
        .toList();
    emit( CategorieCubitConditionalSuccess());
  }

}