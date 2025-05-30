import 'package:hive/hive.dart';
part 'details_commades.g.dart';

@HiveType(typeId: 3)
class DetailsCommades extends HiveObject {
  @HiveField(0)
  String? id_Details_commande;
  @HiveField(1)
  String ?id_commande;
  @HiveField(2)
  String ?id_produit;
  @HiveField(3)
  String ?nom_produit;
  @HiveField(4)
  int? quantity;  
  @HiveField(5)
  double? prix;
  @HiveField(6)
  double ?remise;
  @HiveField(7)
  double ?total;
  @HiveField(8)
  List<String>? list_produit;
  @HiveField(9)
  List<String> ?list_commandes;
  DetailsCommades({
    required this.id_Details_commande,
    required this.id_commande,
    required this.id_produit,
    required this.nom_produit,
    required this.quantity,
    required this.prix,
    required this.remise,
    required this.total,
    required this.list_produit,
    required this.list_commandes,
  });
  DetailsCommades.fromJson(Map<String, dynamic> json) {
    id_Details_commande = json['id_Details_commande'];
    id_commande = json['id_commande'];
    id_produit = json['id_produit'];
    nom_produit = json['nom_produit'];
    quantity = json['quantity'];
    prix = json['prix'];
    remise = json['remise'];
    total = json['total'];
    list_produit = List<String>.from(json['list_produit']);
    list_commandes = List<String>.from(json['list_commandes']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_Details_commande'] = id_Details_commande;
    data['id_commande'] = id_commande;
    data['id_produit'] = id_produit;
    data['nom_produit'] = nom_produit;
    data['quantity'] = quantity;
    data['prix'] = prix;
    data['remise'] = remise;
    data['total'] = total;
    data['list_produit'] = list_produit;
    data['list_commandes'] = list_commandes;
    return data;
    }
  DetailsCommades.fromMap(Map<String, dynamic> map) {
    id_Details_commande = map['id_Details_commande'];
    id_commande = map['id_commande'];
    id_produit = map['id_produit'];
    nom_produit = map['nom_produit'];
    quantity = map['quantity'];
    prix = map['prix'];
    remise = map['remise'];
    total = map['total'];
    list_produit = List<String>.from(map['list_produit']);
    list_commandes = List<String>.from(map['list_commandes']);
  } 
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_Details_commande'] = id_Details_commande;
    data['id_commande'] = id_commande;
    data['id_produit'] = id_produit;
    data['nom_produit'] = nom_produit;
    data['quantity'] = quantity;
    data['prix'] = prix;
    data['remise'] = remise;
    data['total'] = total;
    data['list_produit'] = list_produit;
    data['list_commandes'] = list_commandes;
    return data;}
    
}
