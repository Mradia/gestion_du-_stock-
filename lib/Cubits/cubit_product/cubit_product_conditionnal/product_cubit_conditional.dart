import 'package:flutter_application_gestion_stock/Models/Produit.dart';

import 'package:flutter_application_gestion_stock/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';


part 'product_cubit_conditional_state.dart';

class ProductCubitConditional extends Cubit<ProductCubitConditionalState> {
  ProductCubitConditional() : super(ProductCubitConditionalInitial());

  // You can add methods here to manage the state of client conditions
  // For example, checking if a client meets certain conditions, etc.
  
 List<Produit>? produitsfltter ;
  void fetchProduitsfilter(String text) {
    var produitBox = Hive.box<Produit>(kProduitBox);
    produitsfltter = produitBox.values
        .where((pr) => pr.nom_produit == text)
        .toList();
    emit( ProductCubitConditionalSuccess());
  }

}