import 'package:hive/hive.dart';
part 'utilisateur.g.dart';

@HiveType(typeId: 5)
class Utilisateur extends HiveObject {
  @HiveField(0)
  String? id_utilisateur;
  @HiveField(1)   
  String? Nom_utilisateur;
  @HiveField(2)
  String? Mot_de_passe_utilisateur;
  @HiveField(3)
  String? Type_utilisateur;
  Utilisateur({
    required this.id_utilisateur,
    required this.Nom_utilisateur,
    required this.Mot_de_passe_utilisateur,
    required this.Type_utilisateur,
  });
  Map<String, dynamic> toJson() {
    return {
      'id_utilisateur': id_utilisateur,
      'Nom_utilisateur': Nom_utilisateur,
      'Mot_de_passe_utilisateur': Mot_de_passe_utilisateur,
      'Type_utilisateur': Type_utilisateur,
    };
  }
  factory Utilisateur.fromJson(Map<String, dynamic> json) {
    return Utilisateur(
      id_utilisateur: json['id_utilisateur'],
      Nom_utilisateur: json['Nom_utilisateur'],
      Mot_de_passe_utilisateur: json['Mot_de_passe_utilisateur'],
      Type_utilisateur: json['Type_utilisateur'],
    );
  }
  @override
  String toString() {
    return 'Utilisateur{id_utilisateur: $id_utilisateur, Nom_utilisateur: $Nom_utilisateur, Mot_de_passe_utilisateur: $Mot_de_passe_utilisateur, Type_utilisateur: $Type_utilisateur}';
  }

}