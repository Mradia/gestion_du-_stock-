// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Produit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProduitAdapter extends TypeAdapter<Produit> {
  @override
  final int typeId = 4;

  @override
  Produit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Produit(
      id_produit: fields[0] as String?,
      nom_produit: fields[1] as String?,
      Quantity: fields[2] as int?,
      prix_produit: fields[3] as double?,
      image_produit: fields[4] as String?,
      id_categorie: fields[5] as String?,
      list_categorie: (fields[6] as List?)?.cast<String>(),
      list_details_commandes: (fields[7] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Produit obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id_produit)
      ..writeByte(1)
      ..write(obj.nom_produit)
      ..writeByte(2)
      ..write(obj.Quantity)
      ..writeByte(3)
      ..write(obj.prix_produit)
      ..writeByte(4)
      ..write(obj.image_produit)
      ..writeByte(5)
      ..write(obj.id_categorie)
      ..writeByte(6)
      ..write(obj.list_categorie)
      ..writeByte(7)
      ..write(obj.list_details_commandes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProduitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
