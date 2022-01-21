import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/home_page.dart';
import 'package:flutter_application_1/src/services/cloudbinary_service.dart';
import 'package:image_picker/image_picker.dart';

class RegistroWidgtet extends StatefulWidget {
  const RegistroWidgtet({Key? key}) : super(key: key);

  @override
  _RegistroWidgtetState createState() => _RegistroWidgtetState();
}

class _RegistroWidgtetState extends State<RegistroWidgtet> {
  File? fimagen;
  String? urlImagen;
  final nombre = TextEditingController();
  final contrasenia = TextEditingController();
  final correo = TextEditingController();
  final CloudService _fotosService = CloudService();

  @override
  void initState() {
    super.initState();
  }

  Future _selectImage(ImageSource source) async {
    final imageCamera = await ImagePicker().pickImage(source: source);
    if (imageCamera == null) return;
    final imageTemporary = File(imageCamera.path);
    fimagen = imageTemporary;

    urlImagen = await _fotosService.uploadImage(fimagen!);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Registro de Paciente"),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.name,
                controller: nombre,
                decoration: const InputDecoration(
                    labelText: "Nombre",
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.people,
                      color: Colors.black,
                    )),
              ),
              TextFormField(
                obscureText: true,
                obscuringCharacter: "*",
                keyboardType: TextInputType.name,
                controller: contrasenia,
                decoration: const InputDecoration(
                    labelText: "Contraseña",
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.security,
                      color: Colors.black,
                    )),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: correo,
                decoration: const InputDecoration(
                    labelText: "Correo electrónico",
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: OutlinedButton(
                          child: const Icon(
                            Icons.image,
                            color: Colors.black,
                          ),
                          onPressed: () => _selectImage(ImageSource.gallery)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: OutlinedButton(
                          child: const Icon(
                            Icons.add_a_photo,
                            color: Colors.black,
                          ),
                          onPressed: () => _selectImage(ImageSource.camera)),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                      child: const Text("Aceptar"),
                      onPressed: () async {
                        await _sensrvdr();
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                  "Paciente Añadido",
                                  textAlign: TextAlign.center,
                                ),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: const [
                                      Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          child: const Icon(
                                            Icons.save,
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomePage()),
                                            );
                                          }),
                                    ],
                                  ),
                                ],
                              );
                            });
                      }),
                  MaterialButton(
                      child: const Text("Cancelar"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _sensrvdr() async {
    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      CollectionReference reference =
          FirebaseFirestore.instance.collection('registro');
      await reference.add({
        "nombre": nombre.text,
        "correo": correo.text,
        "contrasenia": contrasenia.text,
        "url": urlImagen,
      });
    });
  }
}
