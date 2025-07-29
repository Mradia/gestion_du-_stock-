
import 'package:flutter_application_gestion_stock/Models/Produit.dart';

import 'package:flutter_application_gestion_stock/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState>{
  ProductsCubit() : super(ProductsInitial());

  // You can add methods here to manage the state of clients
  // For example, fetching clients, adding a new client, etc.
  List<Produit>? products ;
  void fetchProducts() {
    // Logic to fetch clients and emit ClientsSuccess or ClientsFailure
    var productBox = Hive.box<Produit>(kProduitBox);
    products = productBox.values.toList();
    emit(ProductsSuccess());
  }
  


  
}