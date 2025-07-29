part of 'add_categorie_cubit.dart';






abstract class AddCategorieState {}
class AddCategorieInitial extends AddCategorieState {}
class AddCategorieLoading extends AddCategorieState {}  
class AddCategorieSuccess extends AddCategorieState {}
class AddCategorieFailure extends AddCategorieState {
  final String error;
  AddCategorieFailure(this.error);
}