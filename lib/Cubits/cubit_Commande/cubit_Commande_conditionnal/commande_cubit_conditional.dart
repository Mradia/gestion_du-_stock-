
import 'package:flutter_application_gestion_stock/Models/commande.dart';
import 'package:flutter_application_gestion_stock/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';


part 'commande_cubit_conditional_state.dart';

class CommandeCubitConditional extends Cubit<CommandeCubitConditionalState> {
  CommandeCubitConditional() : super(CommandeCubitConditionalInitial());

  // You can add methods here to manage the state of client conditions
  // For example, checking if a client meets certain conditions, etc.
  
 List<Commande>? commandesfltter ;
  void fetchCommandesfilter(String date1, String date2) {
    var commandeBox = Hive.box<Commande>(kCommandeBox);
    commandesfltter = commandeBox.values
      
        .where((commande) {
          final commandeDate = DateTime.tryParse(commande.date_commande ?? '');
          final startDate = DateTime.tryParse(date1);
          final endDate = DateTime.tryParse(date2);
          if (commandeDate == null || startDate == null || endDate == null) return false;
          return commandeDate.isAfter(startDate.subtract(const Duration(days: 1))) &&
                 commandeDate.isBefore(endDate.add(const Duration(days: 1)));
        }) .toList();
    emit( CommandeCubitConditionalSuccess());
  }

}