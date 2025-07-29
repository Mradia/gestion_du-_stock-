

import 'package:flutter_application_gestion_stock/Models/Produit.dart';

import 'package:flutter_application_gestion_stock/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
part 'add_product_state.dart';



class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());

 
  addProduct(Produit product,) async {
    emit(AddProductLoading());
    try {
      // Save image to Hive as bytes if provided
    

      var productBox = Hive.box<Produit>(kProduitBox);
      await productBox.add(product);
      emit(AddProductSuccess());
    } catch (e) {
      emit(AddProductFailure(e.toString()));
    }
  }
}