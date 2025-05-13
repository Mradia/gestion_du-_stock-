import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/containerblacktext.dart';

class Lignelistev extends StatefulWidget {
  const Lignelistev({super.key});

  @override
  State<Lignelistev> createState() => _LignelistevState();
}

class _LignelistevState extends State<Lignelistev> {
  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(w * 0.01),
      child: Row(
        children: [
        Containerblacktext(text: "id",color: true,),
         Containerblacktext(text: "Nom",color: true,),
      Containerblacktext(text: "Prenom",color: true,),
       Containerblacktext(text: "Adresse",color: true,),
        Containerblacktext(text: "Telephone",color: true,),
         Containerblacktext(text: "Email",color: true,),
          Containerblacktext(text: "Pays",color: true,),
           Containerblacktext(text: "Ville",color: true,),
        ],
      ),
    );
  }
}