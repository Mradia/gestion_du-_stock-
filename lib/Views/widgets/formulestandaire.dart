import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_gestion_stock/Views/widgetsclintV/ajouteClientV.dart';

class Formulestandaire extends StatefulWidget {
    final double widthScreen;
    final String? text;
    final Widget? classtype;
  const Formulestandaire({super.key, required this.widthScreen, this.text, this.classtype});

  @override
  State<Formulestandaire> createState() => _FormulestandaireState();
}

class _FormulestandaireState extends State<Formulestandaire> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.black,
        title:  Text(
            widget.text ?? "Formulaire",
            style: TextStyle(color: Colors.white),
        ),
        content: Container(
             height: widget.widthScreen * 0.35,
      width: widget.widthScreen * 0.5,
      color: Colors.black,
            child:widget.classtype ?? Ajouteclientv(
              widthScreen: widget.widthScreen,
              isLoading: false,
    )));
  }
}