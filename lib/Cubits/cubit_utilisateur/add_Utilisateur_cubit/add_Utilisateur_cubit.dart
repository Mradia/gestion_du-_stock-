import 'package:flutter_application_gestion_stock/Models/client.dart';
import 'package:flutter_application_gestion_stock/Models/utilisateur.dart';
import 'package:flutter_application_gestion_stock/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
part 'add_Utilisateur_state.dart';



class AddUtilisateurCubit extends Cubit<AddUtilisateurState> {
  AddUtilisateurCubit() : super(AddUtilisateurInitial());

 
  addUtilisateur(Utilisateur utilisateur) async {
  
    emit(AddUtilisateurLoading());
    try {
      var utilisateursBox = Hive.box<Utilisateur>(kUtilisateurBox);
      await utilisateursBox.add(utilisateur);
      emit(AddUtilisateurSuccess());
    } catch (e) {
      emit(AddUtilisateurFailure(e.toString()));
    }
  }
}