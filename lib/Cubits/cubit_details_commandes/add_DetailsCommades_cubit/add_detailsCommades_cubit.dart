
import 'package:flutter_application_gestion_stock/Models/details_commades.dart';
import 'package:flutter_application_gestion_stock/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
part 'add_DetailsCommades_state.dart';

// Define the AddDetailsCommadesState class if it does not exist




class AddDetailsCommadesCubit extends Cubit<AddDetailsCommadesState> {
  AddDetailsCommadesCubit() : super(AddDetailsCommadesInitial());

 
  addDetailsCommades(DetailsCommades detailsCommades) async {
  
    emit(AddDetailsCommadesLoading());
    try {
      var detailsCommadessBox = Hive.box<DetailsCommades>(kDetailsCommadesBox);
      await detailsCommadessBox.add(detailsCommades);
      emit(AddDetailsCommadesSuccess());
    } catch (e) {
      emit(AddDetailsCommadesFailure(e.toString()));
    }
  }
}