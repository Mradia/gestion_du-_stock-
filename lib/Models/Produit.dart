class Produit {
 String?  id_produit;
 String?  nom_produit;
 int? Quantity;
 double? prix_produit;
 String? image_produit;
 String? id_categorie;
 List <String>? list_categorie;
 List <String>? list_details_commandes;
 Produit({
   required this.id_produit,
   required this.nom_produit,
   required this.Quantity,
   required this.prix_produit,
   required this.image_produit,
   required this.id_categorie,
   required this.list_categorie,
   required this.list_details_commandes,
 });
  Produit.fromJson(Map<String, dynamic> json) {
    id_produit = json['id_produit'];
    nom_produit = json['nom_produit'];
    Quantity = json['Quantity'];
    prix_produit = json['prix_produit'];
    image_produit = json['image_produit'];
    id_categorie = json['id_categorie'];
    list_categorie = List<String>.from(json['list_categorie']);
    list_details_commandes = List<String>.from(json['list_details_commandes']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_produit'] = id_produit;
    data['nom_produit'] = nom_produit;
    data['Quantity'] = Quantity;
    data['prix_produit'] = prix_produit;
    data['image_produit'] = image_produit;
    data['id_categorie'] = id_categorie;
    data['list_categorie'] = list_categorie;
    data['list_details_commandes'] = list_details_commandes;
    return data;} 
  Produit.fromMap(Map<String, dynamic> map) {
    id_produit = map['id_produit'];
    nom_produit = map['nom_produit'];
    Quantity = map['Quantity'];
    prix_produit = map['prix_produit'];
    image_produit = map['image_produit'];
    id_categorie = map['id_categorie'];
    list_categorie = List<String>.from(map['list_categorie']);
    list_details_commandes = List<String>.from(map['list_details_commandes']);
    } 
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_produit'] = id_produit;
    data['nom_produit'] = nom_produit;
    data['Quantity'] = Quantity;
    data['prix_produit'] = prix_produit;
    data['image_produit'] = image_produit;
    data['id_categorie'] = id_categorie;
    data['list_categorie'] = list_categorie;
    data['list_details_commandes'] = list_details_commandes;
    return data;}
}
