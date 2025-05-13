// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_commades.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DetailsCommadesAdapter extends TypeAdapter<DetailsCommades> {
  @override
  final int typeId = 3;

  @override
  DetailsCommades read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DetailsCommades(
      id_Details_commande: fields[0] as String?,
      id_commande: fields[1] as String?,
      id_produit: fields[2] as String?,
      nom_produit: fields[3] as String?,
      quantity: fields[4] as int?,
      prix: fields[5] as double?,
      remise: fields[6] as double?,
      total: fields[7] as double?,
      list_produit: (fields[8] as List?)?.cast<String>(),
      list_commandes: (fields[9] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, DetailsCommades obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id_Details_commande)
      ..writeByte(1)
      ..write(obj.id_commande)
      ..writeByte(2)
      ..write(obj.id_produit)
      ..writeByte(3)
      ..write(obj.nom_produit)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.prix)
      ..writeByte(6)
      ..write(obj.remise)
      ..writeByte(7)
      ..write(obj.total)
      ..writeByte(8)
      ..write(obj.list_produit)
      ..writeByte(9)
      ..write(obj.list_commandes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailsCommadesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
