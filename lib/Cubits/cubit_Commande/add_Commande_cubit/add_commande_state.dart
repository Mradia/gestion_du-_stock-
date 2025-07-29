part of 'add_Commande_cubit.dart';






abstract class AddCommandeState {}
class AddCommandeInitial extends AddCommandeState {}
class AddCommandeLoading extends AddCommandeState {}  
class AddCommandeSuccess extends AddCommandeState {}
class AddCommandeFailure extends AddCommandeState {
  final String error;
  AddCommandeFailure(this.error);
}