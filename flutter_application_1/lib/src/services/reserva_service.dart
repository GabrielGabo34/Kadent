import 'package:flutter_application_1/src/models/reserva_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReservaApp {
  ReservaApp();

  final String _rootUrl = 'https://clinica-kdent-b569f.web.app/api/reserva';

  Future<List<Reserva>> getReserva() async {
    List<Reserva> resultReserva = [];
    try {
      var url = Uri.parse(_rootUrl);
      final responseList = await http.get(url);
      List<dynamic> listReserva = json.decode(responseList.body);

      for (var item in listReserva) {
        final reserva = Reserva.fromJson(item);
        resultReserva.add(reserva);
      }
    } catch (ex) {
      //print(ex);
      return resultReserva;
    }

    return resultReserva;
  }
}
