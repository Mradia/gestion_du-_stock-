import 'package:flutter/foundation.dart';

class DropdownValueProvider with ChangeNotifier {
  String _dropdownValue = 'All';

  String get dropdownValue => _dropdownValue;

  set dropdownValue(String newValue) {
    if (_dropdownValue != newValue) {
      _dropdownValue = newValue;
      notifyListeners();
    }
  }
    String _categorie = '';

  String get categorie => _categorie;

  set categorie (String newValue) {
    if (_categorie != newValue) {
      _categorie = newValue;
      notifyListeners();
    }
  }

     bool _signedIn = false;

  bool get signedIn => _signedIn;

  set signedIn (bool newValue) {
    if (_signedIn != newValue) {
      _signedIn = newValue;
      notifyListeners();
    }
  }

   String _selectedCategorieValue = 'Admin';

  String get selectedCategorieValue => _selectedCategorieValue;

  set selectedCategorieValue(String newValue) {
    if (_selectedCategorieValue != newValue) {
      _selectedCategorieValue = newValue;
      notifyListeners();
    }
  }
}