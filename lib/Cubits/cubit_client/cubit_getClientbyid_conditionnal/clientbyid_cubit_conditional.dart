
import 'package:flutter_application_gestion_stock/Models/client.dart';

import 'package:flutter_application_gestion_stock/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';


part 'clientbyid_cubit_conditional_state.dart';

class ClientidCubitConditional extends Cubit<ClientidCubitConditionalState> {
  ClientidCubitConditional() : super(ClientidCubitConditionalInitial());

  // You can add methods here to manage the state of client conditions
  // For example, checking if a client meets certain conditions, etc.
  
 List<Client>? clientsidfltter ;
  void fetchClientidfilter( String id_client)  {
    var clientBox = Hive.box<Client>(kClientBox);
    clientsidfltter = clientBox.values
        .where((client) => client.id_client == id_client
      )
        .toList();
    emit( ClientidCubitConditionalSuccess());
  }

}