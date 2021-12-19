import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/reserva_model.dart';
import 'package:flutter_application_1/src/services/reserva_service.dart';
import 'package:flutter_application_1/src/widgets/reserva_card.dart';

class ReservaWidget extends StatefulWidget {
  const ReservaWidget({Key? key}) : super(key: key);

  @override
  _ReservaWidgetState createState() => _ReservaWidgetState();
}

class _ReservaWidgetState extends State<ReservaWidget> {
  final ReservaApp _reservaapp = ReservaApp();
  List<Reserva>? _listreserva;

  @override
  void initState() {
    super.initState();
    _downloadreserva();
  }

  @override
  Widget build(BuildContext context) {
    return _listreserva == null
        ? const Center(
            child: SizedBox(
                height: 50.0, width: 50.0, child: CircularProgressIndicator()))
        : _listreserva!.isEmpty
            ? const Center(child: SizedBox(child: Text("No Hay Lecturas")))
            : Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 25.0, horizontal: 14.0),
                child: ListView(
                    children: _listreserva!
                        .map((e) => ReservaCard(model: e))
                        .toList()));
  }

  _downloadreserva() async {
    _listreserva = await _reservaapp.getReserva();
    setState(() {});
  }
}
