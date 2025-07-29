part of 'add_detailsCommades_cubit.dart';






abstract class AddDetailsCommadesState {}
class AddDetailsCommadesInitial extends AddDetailsCommadesState {}
class AddDetailsCommadesLoading extends AddDetailsCommadesState {}  
class AddDetailsCommadesSuccess extends AddDetailsCommadesState {}
class AddDetailsCommadesFailure extends AddDetailsCommadesState {
  final String error;
  AddDetailsCommadesFailure(this.error);
}