import 'package:hive/hive.dart';
part 'client.g.dart'; 

@HiveType(typeId: 1)
class Client extends HiveObject {
  @HiveField(0)
  String? id_client;
  @HiveField(1)
  String? name_client;
  @HiveField(2)
  String? email_client;
  @HiveField(3)
  String? phone_client;
  @HiveField(4)
  String? address_client;
  @HiveField(5)
  String? ville_client;
  @HiveField(6)
  String? Prenom_client;
  @HiveField(7)
  String? Pays_client;
  @HiveField(8)


  List<String>? list_commande;
Client({
    required this.id_client,
    required this.name_client,
    required this.email_client,
    required this.phone_client,
    required this.address_client,
    required this.ville_client,
    required this.Prenom_client,
    required this.Pays_client,
    required this.list_commande,


  });
  Client.fromJson(Map<String, dynamic> json, this.id_client) {
    id_client = json['id_client'];
    name_client = json['name_client'];
    email_client = json['email_client'];
    phone_client = json['phone_client'];
    address_client = json['address_client'];
    ville_client = json['ville_client'];
    Prenom_client = json['Prenom_client'];
    Pays_client = json['Pays_client'];
    list_commande = List<String>.from(json['list_commande']);
  } 
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_client'] = id_client;
    data['name_client'] = name_client;
    data['email_client'] = email_client;
    data['phone_client'] = phone_client;
    data['address_client'] = address_client;
    data['ville_client'] = ville_client;
    data['Prenom_client'] = Prenom_client;
    data['Pays_client'] = Pays_client;
    data['list_commande'] = list_commande;
    return data;
  }
  Client.fromMap(Map<String, dynamic> map) {
    id_client = map['id_client'];
    name_client = map['name_client'];
    email_client = map['email_client'];
    phone_client = map['phone_client'];
    address_client = map['address_client'];
    ville_client = map['ville_client'];
    Prenom_client = map['Prenom_client'];
    Pays_client = map['Pays_client'];
    list_commande = List<String>.from(map['list_commande']);
  }

}
