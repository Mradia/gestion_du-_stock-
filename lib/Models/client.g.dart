// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClientAdapter extends TypeAdapter<Client> {
  @override
  final int typeId = 1;

  @override
  Client read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Client(
      id_client: fields[0] as String?,
      name_client: fields[1] as String?,
      email_client: fields[2] as String?,
      phone_client: fields[3] as String?,
      address_client: fields[4] as String?,
      ville_client: fields[5] as String?,
      Prenom_client: fields[6] as String?,
      Pays_client: fields[7] as String?,
      list_commande: (fields[8] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Client obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id_client)
      ..writeByte(1)
      ..write(obj.name_client)
      ..writeByte(2)
      ..write(obj.email_client)
      ..writeByte(3)
      ..write(obj.phone_client)
      ..writeByte(4)
      ..write(obj.address_client)
      ..writeByte(5)
      ..write(obj.ville_client)
      ..writeByte(6)
      ..write(obj.Prenom_client)
      ..writeByte(7)
      ..write(obj.Pays_client)
      ..writeByte(8)
      ..write(obj.list_commande);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
