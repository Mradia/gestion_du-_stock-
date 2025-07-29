import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_Categorie/getidcategorie/get_id_categorie_cubit.dart';
import 'package:flutter_application_gestion_stock/Models/categorie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_gestion_stock/provider/valeur.dart';

class Dropdowncategorie extends StatefulWidget {
  final double width;
  final double height;
  final List<Categorie> categories;

  const Dropdowncategorie({
    super.key,
    required this.width,
    required this.height,
    required this.categories,
  });

  @override
  State<Dropdowncategorie> createState() => _DropdowncategorieState();
}

class _DropdowncategorieState extends State<Dropdowncategorie> {
  List<String> items = [""];

  @override
  void initState() {
    // TODO: implement initState

    for (var i = 0; i < widget.categories.length; i++) {
      items.add(widget.categories[i].nom_categorie!.toString());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dropdownProvider = Provider.of<DropdownValueProvider>(context);
    return Container(
      height: widget.height * 0.03,

      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(
          left: widget.width * 0.009,
          right: widget.width * 0.002,
        ),

        child: DropdownButton(
          underline: SizedBox(),
          dropdownColor: Colors.white,
          focusColor: Colors.white,
          // Initial Value
          value: dropdownProvider.categorie,

          // Down Arrow Icon
          icon: const Icon(Icons.keyboard_arrow_down),

          // Array list of items
          items:
              items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: widget.height * 0.015,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            setState(() {
              dropdownProvider.categorie = newValue!;
            });
         
          },
        ),
      ),
    );
  }
}
