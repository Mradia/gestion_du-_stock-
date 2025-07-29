
import 'package:flutter_application_gestion_stock/Models/commande.dart';
import 'package:flutter_application_gestion_stock/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
part 'add_commande_state.dart';



class AddCommandeCubit extends Cubit<AddCommandeState> {
  AddCommandeCubit() : super(AddCommandeInitial());

 
  addClient(Commande commande) async {
  
    emit(AddCommandeLoading());
    try {
      var commandesBox = Hive.box<Commande>(kCommandeBox);
      await commandesBox.add(commande);
      emit(AddCommandeSuccess());
    } catch (e) {
      emit(AddCommandeFailure(e.toString()));
    }
  }
}