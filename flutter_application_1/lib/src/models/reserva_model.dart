// To parse this JSON data, do
//
//     final reserva = reservaFromJson(jsonString);

import 'dart:convert';

List<Reserva> reservaFromJson(String str) =>
    List<Reserva>.from(json.decode(str).map((x) => Reserva.fromJson(x)));

String reservaToJson(List<Reserva> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reserva {
  Reserva({
    this.fieldsProto,
  });

  FieldsProto? fieldsProto;

  factory Reserva.fromJson(Map<String, dynamic> json) => Reserva(
        fieldsProto: FieldsProto.fromJson(json["_fieldsProto"]),
      );

  Map<String, dynamic> toJson() => {
        "_fieldsProto": fieldsProto!.toJson(),
      };
}

class FieldsProto {
  FieldsProto({
    this.paciente,
    this.medico,
    this.fechahora,
    this.titulo,
    this.mensaje,
    this.pago,
  });

  Paciente? paciente;
  Medico? medico;
  Fecha? fechahora;
  Mensaje? titulo;
  Mensaje? mensaje;
  Pago? pago;

  factory FieldsProto.fromJson(Map<String, dynamic> json) => FieldsProto(
        paciente: Paciente.fromJson(json["paciente"]),
        medico: Medico.fromJson(json["medico"]),
        fechahora: Fecha.fromJson(json["fechahora"]),
        titulo: Mensaje.fromJson(json["titulo"]),
        mensaje: Mensaje.fromJson(json["mensaje"]),
        pago: Pago.fromJson(json["pago"]),
      );

  Map<String, dynamic> toJson() => {
        "paciente": paciente!.toJson(),
        "medico": medico!.toJson(),
        "fechahora": fechahora!.toJson(),
        "titulo": titulo!.toJson(),
        "mensaje": mensaje!.toJson(),
        "pago": pago!.toJson(),
      };
}

class Fecha {
  Fecha({
    this.timestampValue,
    this.valueType,
  });

  TimestampValue? timestampValue;
  String? valueType;

  factory Fecha.fromJson(Map<String, dynamic> json) => Fecha(
        timestampValue: TimestampValue.fromJson(json["timestampValue"]),
        valueType: json["valueType"],
      );

  Map<String, dynamic> toJson() => {
        "timestampValue": timestampValue!.toJson(),
        "valueType": valueType,
      };
}

class TimestampValue {
  TimestampValue({
    this.seconds,
    this.nanos,
  });

  String? seconds;
  int? nanos;

  factory TimestampValue.fromJson(Map<String, dynamic> json) => TimestampValue(
        seconds: json["seconds"],
        nanos: json["nanos"],
      );

  Map<String, dynamic> toJson() => {
        "seconds": seconds,
        "nanos": nanos,
      };
}

class Medico {
  Medico({
    this.mapValue,
    this.valueType,
  });

  MedicoMapValue? mapValue;
  String? valueType;

  factory Medico.fromJson(Map<String, dynamic> json) => Medico(
        mapValue: MedicoMapValue.fromJson(json["mapValue"]),
        valueType: json["valueType"],
      );

  Map<String, dynamic> toJson() => {
        "mapValue": mapValue!.toJson(),
        "valueType": valueType,
      };
}

class MedicoMapValue {
  MedicoMapValue({
    this.fields,
  });

  PurpleFields? fields;

  factory MedicoMapValue.fromJson(Map<String, dynamic> json) => MedicoMapValue(
        fields: PurpleFields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "fields": fields!.toJson(),
      };
}

class PurpleFields {
  PurpleFields({
    this.datosM,
    this.id,
    this.especialidad,
  });

  DatosM? datosM;
  Id? id;
  Mensaje? especialidad;

  factory PurpleFields.fromJson(Map<String, dynamic> json) => PurpleFields(
        datosM: DatosM.fromJson(json["datos_M"]),
        id: Id.fromJson(json["id"]),
        especialidad: Mensaje.fromJson(json["especialidad"]),
      );

  Map<String, dynamic> toJson() => {
        "datos_M": datosM!.toJson(),
        "id": id!.toJson(),
        "especialidad": especialidad!.toJson(),
      };
}

class DatosM {
  DatosM({
    this.mapValue,
    this.valueType,
  });

  DatosMMapValue? mapValue;
  String? valueType;

  factory DatosM.fromJson(Map<String, dynamic> json) => DatosM(
        mapValue: DatosMMapValue.fromJson(json["mapValue"]),
        valueType: json["valueType"],
      );

  Map<String, dynamic> toJson() => {
        "mapValue": mapValue!.toJson(),
        "valueType": valueType,
      };
}

class DatosMMapValue {
  DatosMMapValue({
    this.fields,
  });

  FluffyFields? fields;

  factory DatosMMapValue.fromJson(Map<String, dynamic> json) => DatosMMapValue(
        fields: FluffyFields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "fields": fields!.toJson(),
      };
}

class FluffyFields {
  FluffyFields({
    this.nombre,
    this.apellido,
    this.telefono,
    this.cedula,
    this.email,
    this.fechadenacimiento,
    this.direccion,
  });

  Mensaje? nombre;
  Mensaje? apellido;
  Mensaje? telefono;
  Id? cedula;
  Mensaje? email;
  Fecha? fechadenacimiento;
  Mensaje? direccion;

  factory FluffyFields.fromJson(Map<String, dynamic> json) => FluffyFields(
        nombre: Mensaje.fromJson(json["nombre"]),
        apellido: Mensaje.fromJson(json["apellido"]),
        telefono: Mensaje.fromJson(json["telefono"]),
        cedula: Id.fromJson(json["cedula"]),
        email: Mensaje.fromJson(json["email"]),
        fechadenacimiento: Fecha.fromJson(json["fechadenacimiento"]),
        direccion: Mensaje.fromJson(json["direccion"]),
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre!.toJson(),
        "apellido": apellido!.toJson(),
        "telefono": telefono!.toJson(),
        "cedula": cedula!.toJson(),
        "email": email!.toJson(),
        "fechadenacimiento": fechadenacimiento!.toJson(),
        "direccion": direccion!.toJson(),
      };
}

class Mensaje {
  Mensaje({
    this.stringValue,
    this.valueType,
  });

  String? stringValue;
  ValueType? valueType;

  factory Mensaje.fromJson(Map<String, dynamic> json) => Mensaje(
        stringValue: json["stringValue"],
        valueType: valueTypeValues.map![json["valueType"]],
      );

  Map<String, dynamic> toJson() => {
        "stringValue": stringValue,
        "valueType": valueTypeValues.reverse[valueType],
      };
}

enum ValueType { STRING_VALUE }

final valueTypeValues = EnumValues({"stringValue": ValueType.STRING_VALUE});

class Id {
  Id({
    this.integerValue,
    this.valueType,
  });

  String? integerValue;
  String? valueType;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        integerValue: json["integerValue"],
        valueType: json["valueType"],
      );

  Map<String, dynamic> toJson() => {
        "integerValue": integerValue,
        "valueType": valueType,
      };
}

class Paciente {
  Paciente({
    this.mapValue,
    this.valueType,
  });

  PacienteMapValue? mapValue;
  String? valueType;

  factory Paciente.fromJson(Map<String, dynamic> json) => Paciente(
        mapValue: PacienteMapValue.fromJson(json["mapValue"]),
        valueType: json["valueType"],
      );

  Map<String, dynamic> toJson() => {
        "mapValue": mapValue!.toJson(),
        "valueType": valueType,
      };
}

class PacienteMapValue {
  PacienteMapValue({
    this.fields,
  });

  TentacledFields? fields;

  factory PacienteMapValue.fromJson(Map<String, dynamic> json) =>
      PacienteMapValue(
        fields: TentacledFields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "fields": fields!.toJson(),
      };
}

class TentacledFields {
  TentacledFields({
    this.datosP,
    this.id,
  });

  DatosP? datosP;
  Id? id;

  factory TentacledFields.fromJson(Map<String, dynamic> json) =>
      TentacledFields(
        datosP: DatosP.fromJson(json["datos_P"]),
        id: Id.fromJson(json["id"]),
      );

  Map<String, dynamic> toJson() => {
        "datos_P": datosP!.toJson(),
        "id": id!.toJson(),
      };
}

class DatosP {
  DatosP({
    this.mapValue,
    this.valueType,
  });

  DatosPMapValue? mapValue;
  String? valueType;

  factory DatosP.fromJson(Map<String, dynamic> json) => DatosP(
        mapValue: DatosPMapValue.fromJson(json["mapValue"]),
        valueType: json["valueType"],
      );

  Map<String, dynamic> toJson() => {
        "mapValue": mapValue!.toJson(),
        "valueType": valueType,
      };
}

class DatosPMapValue {
  DatosPMapValue({
    this.fields,
  });

  StickyFields? fields;

  factory DatosPMapValue.fromJson(Map<String, dynamic> json) => DatosPMapValue(
        fields: StickyFields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "fields": fields!.toJson(),
      };
}

class StickyFields {
  StickyFields({
    this.fechadenacimiento,
    this.direccion,
    this.cedula,
    this.telefono,
    this.email,
    this.nombre,
    this.apellido,
  });

  Fecha? fechadenacimiento;
  Mensaje? direccion;
  Id? cedula;
  Id? telefono;
  Mensaje? email;
  Mensaje? nombre;
  Mensaje? apellido;

  factory StickyFields.fromJson(Map<String, dynamic> json) => StickyFields(
        fechadenacimiento: Fecha.fromJson(json["fechadenacimiento"]),
        direccion: Mensaje.fromJson(json["direccion"]),
        cedula: Id.fromJson(json["cedula"]),
        telefono: Id.fromJson(json["telefono"]),
        email: Mensaje.fromJson(json["email"]),
        nombre: Mensaje.fromJson(json["nombre"]),
        apellido: Mensaje.fromJson(json["apellido"]),
      );

  Map<String, dynamic> toJson() => {
        "fechadenacimiento": fechadenacimiento!.toJson(),
        "direccion": direccion!.toJson(),
        "cedula": cedula!.toJson(),
        "telefono": telefono!.toJson(),
        "email": email!.toJson(),
        "nombre": nombre!.toJson(),
        "apellido": apellido!.toJson(),
      };
}

class Pago {
  Pago({
    this.doubleValue,
    this.valueType,
  });

  double? doubleValue;
  String? valueType;

  factory Pago.fromJson(Map<String, dynamic> json) => Pago(
        doubleValue: json["doubleValue"].toDouble(),
        valueType: json["valueType"],
      );

  Map<String, dynamic> toJson() => {
        "doubleValue": doubleValue,
        "valueType": valueType,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
