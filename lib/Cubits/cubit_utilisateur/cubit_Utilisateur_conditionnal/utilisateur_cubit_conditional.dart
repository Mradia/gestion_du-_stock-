
import 'package:flutter_application_gestion_stock/Models/utilisateur.dart';
import 'package:flutter_application_gestion_stock/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';


part 'utilisateur_cubit_conditional_state.dart';

class UtilisateurCubitConditional extends Cubit<UtilisateurCubitConditionalState> {
  UtilisateurCubitConditional() : super(UtilisateurCubitConditionalInitial());

  // You can add methods here to manage the state of client conditions
  // For example, checking if a client meets certain conditions, etc.
  
 List<Utilisateur>? utilisateursfltter ;
  void fetchUtilisateursfilter( )  {
    var utilisateurBox = Hive.box<Utilisateur>(kUtilisateurBox);
    utilisateursfltter = utilisateurBox.values
        .where((utilisateur) => utilisateur.Type_utilisateur == 'Admin'
      )
        .toList();
    emit( UtilisateurCubitConditionalSuccess());
  }

}