class Categorie {
  String? id_categorie;
  String ?nom_categorie;
  List<String>? Produits;
  Categorie({
    required this.id_categorie,
    required this.nom_categorie,
    required this.Produits,
  });
  Categorie.fromJson(Map<String, dynamic> json) {
    id_categorie = json['id_categorie'];
    nom_categorie = json['nom_categorie'];
    Produits = List<String>.from(json['Produits']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_categorie'] = id_categorie;
    data['nom_categorie'] = nom_categorie;
    data['Produits'] = Produits;
    return data;
  }
  Categorie.fromMap(Map<String, dynamic> map) {
    id_categorie = map['id_categorie'];
    nom_categorie = map['nom_categorie'];
    Produits = List<String>.from(map['Produits']);
  }
}
