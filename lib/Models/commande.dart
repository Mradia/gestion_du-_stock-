import 'package:hive/hive.dart';
part 'commande.g.dart';

@HiveType(typeId: 2)
class Commande extends HiveObject {
  @HiveField(0)
  String? id_commande;
  @HiveField(1)
  String? id_client;
  @HiveField(2)
  DateTime ? date_commande;
  @HiveField(3)
  double? total_Ht;
  @HiveField(4)
  double? total_TTC;
  @HiveField(5)
  double? tVA;
  @HiveField(6)
  List<String>? list_Clients;
  @HiveField(7)
  List<String>? list_details_commande;

  Commande({
    required this.id_commande,
    required this.id_client,
    required this.date_commande,
    required this.total_Ht,
    required this.total_TTC,
    required this.tVA,
    required this.list_Clients,
    required this.list_details_commande,
  });
  Commande.fromJson(Map<String, dynamic> json) {
    id_commande = json['id_commande'];
    id_client = json['id_client'];
    date_commande = DateTime.parse(json['date_commande']);
    total_Ht = json['total_Ht'];
    total_TTC = json['total_TTC'];
    tVA = json['tVA'];
    list_Clients = List<String>.from(json['list_Clients']);
    list_details_commande = List<String>.from(json['list_details_commande']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_commande'] = id_commande;
    data['id_client'] = id_client;
    data['date_commande'] = date_commande?.toIso8601String();
    data['total_Ht'] = total_Ht;
    data['total_TTC'] = total_TTC;
    data['tVA'] = tVA;
    data['list_Clients'] = list_Clients;
    data['list_details_commande'] = list_details_commande;
    return data;
  }
  Commande.fromMap(Map<String, dynamic> map) {
    id_commande = map['id_commande'];
    id_client = map['id_client'];
    date_commande = DateTime.parse(map['date_commande']);
    total_Ht = map['total_Ht'];
    total_TTC = map['total_TTC'];
    tVA = map['tVA'];
    list_Clients = List<String>.from(map['list_Clients']);
    list_details_commande = List<String>.from(map['list_details_commande']);
  }
}