

import 'package:flutter_application_gestion_stock/Models/commande.dart';
import 'package:flutter_application_gestion_stock/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'commandes_state.dart';

class CommandesCubit extends Cubit<CommandesState>{
CommandesCubit() : super(CommandesInitial());

  // You can add methods here to manage the state of clients
  // For example, fetching clients, adding a new client, etc.
  List<Commande>? commandes ;
  void fetchCommandes() {
    // Logic to fetch clients and emit ClientsSuccess or ClientsFailure
    var commandeBox = Hive.box<Commande>(kCommandeBox);
    commandes = commandeBox.values.toList();
    emit(CommandesSuccess());
  }
  


  
}