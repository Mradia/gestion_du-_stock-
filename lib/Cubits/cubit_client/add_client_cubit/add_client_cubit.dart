import 'package:flutter_application_gestion_stock/Models/client.dart';
import 'package:flutter_application_gestion_stock/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
part 'add_client_state.dart';

const String kNotesBox = 'notesBox';

class AddClientCubit extends Cubit<AddClientState> {
  AddClientCubit() : super(AddClientInitial());

 
  addClient(Client client) async {
  
    emit(AddClientLoading());
    try {
      var notesBox = Hive.box<Client>(kClientBox);
      await notesBox.add(client);
      emit(AddClientSuccess());
    } catch (e) {
      emit(AddClientFailure(e.toString()));
    }
  }
}