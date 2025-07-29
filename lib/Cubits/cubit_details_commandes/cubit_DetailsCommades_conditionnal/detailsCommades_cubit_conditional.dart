
import 'package:flutter_application_gestion_stock/Models/details_commades.dart';
import 'package:flutter_application_gestion_stock/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';


part 'detailsCommades_cubit_conditional_state.dart';

class DetailsCommadesCubitConditional extends Cubit<DetailsCommadesCubitConditionalState> {
  DetailsCommadesCubitConditional() : super(DetailsCommadesCubitConditionalInitial());

  // You can add methods here to manage the state of client conditions
  // For example, checking if a client meets certain conditions, etc.
  
 List<DetailsCommades>? detailsCommadesfltter ;
  void fetchDetailsCommadesfilter(String text) {
    var detailsCommadesBox = Hive.box<DetailsCommades>(kDetailsCommadesBox);
    detailsCommadesfltter = detailsCommadesBox.values
        .where((detailsCommades) => detailsCommades.id_commande == text)
        .toList();
    emit( DetailsCommadesCubitConditionalSuccess());
  }

}