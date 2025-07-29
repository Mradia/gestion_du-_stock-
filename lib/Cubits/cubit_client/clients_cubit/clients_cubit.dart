import 'package:flutter_application_gestion_stock/Models/categorie.dart';
import 'package:flutter_application_gestion_stock/Models/client.dart';
import 'package:flutter_application_gestion_stock/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'clients_state.dart';

class ClientsCubit extends Cubit<ClientsState>{
ClientsCubit() : super(ClientsInitial());

  // You can add methods here to manage the state of clients
  // For example, fetching clients, adding a new client, etc.
  List<Client>? clients ;
  void fetchClients() {
    // Logic to fetch clients and emit ClientsSuccess or ClientsFailure
    var clientBox = Hive.box<Client>(kClientBox);
    clients = clientBox.values.toList();
    emit(ClientsSuccess());
  }
  


  
}