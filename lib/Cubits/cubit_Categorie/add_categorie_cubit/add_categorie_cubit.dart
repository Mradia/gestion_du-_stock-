import 'package:flutter_application_gestion_stock/Models/categorie.dart';

import 'package:flutter_application_gestion_stock/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
part 'add_categorie_state.dart';



class AddCategorieCubit extends Cubit<AddCategorieState> {
  AddCategorieCubit() : super(AddCategorieInitial());

 
  addCategorie(Categorie categorie) async {
  
    emit(AddCategorieLoading());
    try {
      var categoriesBox = Hive.box<Categorie>(kCategorieBox);
      await categoriesBox.add(categorie);
      emit(AddCategorieSuccess());
    } catch (e) {
      emit(AddCategorieFailure(e.toString()));
    }
  }
}