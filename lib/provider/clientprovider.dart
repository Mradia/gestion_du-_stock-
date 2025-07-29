import 'package:flutter/foundation.dart';
import 'package:flutter_application_gestion_stock/Models/client.dart';

class ClientValueProvider with ChangeNotifier {
  Client _clientValue = Client(
    id_client: '',
    name_client: '',
    Prenom_client: '',
    email_client: '',
    phone_client: '',
    ville_client: '',
    address_client: '',
    Pays_client: '',
    list_commande: [],
  );

  Client get clientValue => _clientValue;

  set clientValue(Client newValue) {
    if (_clientValue != newValue) {
      _clientValue = newValue;
      notifyListeners();
    }
  }

   String _idCommandeValue ="";

  String get idCommandeValue => _idCommandeValue;

  set idCommandeValue(String newValue) {
    if (_idCommandeValue != newValue) {
      _idCommandeValue = newValue;
      notifyListeners();
    }
  }

     double _tVa =0.0;

  double get tVa => _tVa;

  set tVa(double newValue) {
    if (_tVa != newValue) {
      _tVa = newValue;
      notifyListeners();
    }
  }

}