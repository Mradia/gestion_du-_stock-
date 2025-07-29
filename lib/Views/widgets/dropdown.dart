import 'package:flutter/material.dart';

import 'package:flutter_application_gestion_stock/provider/valeur.dart';
import 'package:provider/provider.dart';

class DropdownV extends StatefulWidget {
  const DropdownV({super.key});

  @override
  State<DropdownV> createState() => _DropdownVState();
}

class _DropdownVState extends State<DropdownV> {
  // List of items in our dropdown menu
  List<String> items = [
    'All',
    'nom',
    'prenom',
    'adresse',
    'ville',
    'telephone',
    'email',
    'pays',
    'name',
  ];

 
  @override
  Widget build(BuildContext context) {
    final dropdownProvider = Provider.of<DropdownValueProvider>(context);
    return  DropdownButton(
          // Initial Value
      value: dropdownProvider.dropdownValue,

          // Down Arrow Icon
          icon: const Icon(Icons.keyboard_arrow_down),

          // Array list of items
          items:
              items.map((String items) {
                return DropdownMenuItem(value: items, child: Text(items));
              }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            setState(() {
          dropdownProvider.dropdownValue = newValue!;
            });
  }
        );
  }
}