// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utilisateur.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UtilisateurAdapter extends TypeAdapter<Utilisateur> {
  @override
  final int typeId = 5;

  @override
  Utilisateur read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Utilisateur(
      id_utilisateur: fields[0] as String?,
      Nom_utilisateur: fields[1] as String?,
      Mot_de_passe_utilisateur: fields[2] as String?,
      Type_utilisateur: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Utilisateur obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id_utilisateur)
      ..writeByte(1)
      ..write(obj.Nom_utilisateur)
      ..writeByte(2)
      ..write(obj.Mot_de_passe_utilisateur)
      ..writeByte(3)
      ..write(obj.Type_utilisateur);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UtilisateurAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
