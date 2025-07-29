

import 'package:flutter_application_gestion_stock/Models/utilisateur.dart';
import 'package:flutter_application_gestion_stock/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'utilisateurs_state.dart';

class UtilisateursCubit extends Cubit<UtilisateursState>{
UtilisateursCubit() : super(UtilisateursInitial());

  // You can add methods here to manage the state of clients
  // For example, fetching clients, adding a new client, etc.
  List<Utilisateur>? utilisateurs ;
  void fetchUtilisateurs() {
    // Logic to fetch clients and emit ClientsSuccess or ClientsFailure
    var utilisateurBox = Hive.box<Utilisateur>(kUtilisateurBox);
    utilisateurs = utilisateurBox.values.toList();
    emit(UtilisateursSuccess());
  }
  


  
}