

import 'package:flutter_application_gestion_stock/Models/details_commades.dart';
import 'package:flutter_application_gestion_stock/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'detailsCommades_state.dart';

class DetailsCommadesCubit extends Cubit<DetailsCommadesState>{
DetailsCommadesCubit() : super(DetailsCommadesInitial());

  // You can add methods here to manage the state of clients
  // For example, fetching clients, adding a new client, etc.
  List<DetailsCommades>? detailsCommades ;
  void fetchDetailsCommades() {
    // Logic to fetch clients and emit ClientsSuccess or ClientsFailure
    var detailsCommadesBox = Hive.box<DetailsCommades>(kDetailsCommadesBox);
    detailsCommades = detailsCommadesBox.values.toList();
    emit(DetailsCommadesSuccess());
  }
  


  
}