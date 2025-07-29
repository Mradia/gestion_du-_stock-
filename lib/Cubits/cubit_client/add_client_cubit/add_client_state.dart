part of 'add_client_cubit.dart';






abstract class AddClientState {}
class AddClientInitial extends AddClientState {}
class AddClientLoading extends AddClientState {}  
class AddClientSuccess extends AddClientState {}
class AddClientFailure extends AddClientState {
  final String error;
  AddClientFailure(this.error);
}