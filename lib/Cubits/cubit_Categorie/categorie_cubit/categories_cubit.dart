import 'package:flutter_application_gestion_stock/Models/categorie.dart';

import 'package:flutter_application_gestion_stock/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState>{
CategoriesCubit() : super(CategoriesInitial());

  // You can add methods here to manage the state of clients
  // For example, fetching clients, adding a new client, etc.
  List<Categorie>? categories ;
  void fetchCategories() {
    // Logic to fetch clients and emit ClientsSuccess or ClientsFailure
    var categorieBox = Hive.box<Categorie>(kCategorieBox);
    categories = categorieBox.values.toList();
    emit(CategoriesSuccess());
  }
  


  
}