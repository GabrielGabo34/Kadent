import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/reserva_model.dart';
import 'package:flutter_application_1/src/widgets/reg_widget.dart';

class ReservaCard extends StatelessWidget {
  const ReservaCard({Key? key, required this.model}) : super(key: key);
  final Reserva model;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            elevation: 7.0,
            child: ListTile(
                leading: const Icon(Icons.perm_device_information_outlined),
                title: Text(model.fieldsProto!.titulo!.stringValue!.toString()),
                subtitle:
                    Text(model.fieldsProto!.mensaje!.stringValue!.toString()),
                trailing: Text(model.fieldsProto!.paciente!.mapValue!.fields!
                    .datosP!.mapValue!.fields!.nombre!.stringValue!
                    .toString())),
          ),
        ],
      ),
    );
  }
}
