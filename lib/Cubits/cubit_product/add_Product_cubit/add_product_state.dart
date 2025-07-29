part of 'add_product_cubit.dart';






abstract class AddProductState {}
class AddProductInitial extends AddProductState {}
class AddProductLoading extends AddProductState {}  
class AddProductSuccess extends AddProductState {}
class AddProductFailure extends AddProductState {
  final String error;
  AddProductFailure(this.error);
}