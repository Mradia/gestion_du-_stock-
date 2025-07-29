part of 'add_Utilisateur_cubit.dart';






abstract class AddUtilisateurState {}
class AddUtilisateurInitial extends AddUtilisateurState {}
class AddUtilisateurLoading extends AddUtilisateurState {}  
class AddUtilisateurSuccess extends AddUtilisateurState {}
class AddUtilisateurFailure extends AddUtilisateurState {
  final String error;
  AddUtilisateurFailure(this.error);
}