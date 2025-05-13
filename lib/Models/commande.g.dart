// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commande.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommandeAdapter extends TypeAdapter<Commande> {
  @override
  final int typeId = 2;

  @override
  Commande read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Commande(
      id_commande: fields[0] as String?,
      id_client: fields[1] as String?,
      date_commande: fields[2] as DateTime?,
      total_Ht: fields[3] as double?,
      total_TTC: fields[4] as double?,
      tVA: fields[5] as double?,
      list_Clients: (fields[6] as List?)?.cast<String>(),
      list_details_commande: (fields[7] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Commande obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id_commande)
      ..writeByte(1)
      ..write(obj.id_client)
      ..writeByte(2)
      ..write(obj.date_commande)
      ..writeByte(3)
      ..write(obj.total_Ht)
      ..writeByte(4)
      ..write(obj.total_TTC)
      ..writeByte(5)
      ..write(obj.tVA)
      ..writeByte(6)
      ..write(obj.list_Clients)
      ..writeByte(7)
      ..write(obj.list_details_commande);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommandeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
