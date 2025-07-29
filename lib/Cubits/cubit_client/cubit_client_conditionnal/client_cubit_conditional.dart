import 'package:flutter_application_gestion_stock/Models/client.dart';
import 'package:flutter_application_gestion_stock/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';


part 'client_cubit_conditional_state.dart';

class ClientCubitConditional extends Cubit<ClientCubitConditionalState> {
  ClientCubitConditional() : super(ClientCubitConditionalInitial());

  // You can add methods here to manage the state of client conditions
  // For example, checking if a client meets certain conditions, etc.
  
 List<Client>? clientsfltter ;
  void fetchClientsfilter(String text, String type) {
    var clientBox = Hive.box<Client>(kClientBox);
    clientsfltter = clientBox.values
        .where((client) =>type=='nom'? client.name_client == text:type=='prenom'? client.Prenom_client== text:type=='adresse'? client.address_client == text:type=='ville'? client.ville_client == text:type=='telephone'? client.phone_client == text:type=='email'? client.email_client == text:client.Pays_client == text)
        .toList();
    emit( ClientCubitConditionalSuccess());
  }

}