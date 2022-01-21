import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/providers/provider.dart';
import 'package:flutter_application_1/src/widgets/reg_widget.dart';
import 'package:flutter_application_1/src/widgets/reserva_widget.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final temaController = Get.put(TemaProvider());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const ReservaWidget(),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.lightbulb_outline),
            label: 'Dia',
            onTap: () => temaController.temaClaro(),
          ),
          SpeedDialChild(
            child: const Icon(Icons.brightness_3),
            label: 'Noche',
            onTap: () => temaController.temaOscuro(),
          ),
        ],
      ),
    );
  }
}
