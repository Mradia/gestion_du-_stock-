class Utilisateur {
  String? Nom_utilisateur;
  String? Mot_de_passe_utilisateur;
  String? Type_utilisateur;
  Utilisateur({
    required this.Nom_utilisateur,
    required this.Mot_de_passe_utilisateur,
    required this.Type_utilisateur,
  });
  Utilisateur.fromJson(Map<String, dynamic> json) {
    Nom_utilisateur = json['Nom_utilisateur'];
    Mot_de_passe_utilisateur = json['Mot_de_passe_utilisateur'];
    Type_utilisateur = json['Type_utilisateur'];
  } 
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Nom_utilisateur'] = Nom_utilisateur;
    data['Mot_de_passe_utilisateur'] = Mot_de_passe_utilisateur;
    data['Type_utilisateur'] = Type_utilisateur;
    return data;
  }
  Utilisateur.fromMap(Map<String, dynamic> map) {
    Nom_utilisateur = map['Nom_utilisateur'];
    Mot_de_passe_utilisateur = map['Mot_de_passe_utilisateur'];
    Type_utilisateur = map['Type_utilisateur'];
  }
}