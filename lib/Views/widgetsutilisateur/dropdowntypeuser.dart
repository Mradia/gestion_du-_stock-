import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_gestion_stock/provider/valeur.dart';

class Dropdowntypeuser extends StatefulWidget {
  const Dropdowntypeuser({super.key});

  @override
  State<Dropdowntypeuser> createState() => _DropdowntypeuserState();
}

class _DropdowntypeuserState extends State<Dropdowntypeuser> {
  // Define the list of items and the selected value
  final List<String> items = ['Admin', 'User'];
 

  @override
  Widget build(BuildContext context) {
    final dropdownProvider = Provider.of<DropdownValueProvider>(context);
    final double widthScreen = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;
    return Container(
      height: heightScreen * 0.05,
      width: widthScreen * 0.2,

      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(
          left: widthScreen * 0.009,
          right: widthScreen * 0.002,
        ),

        child: DropdownButton(
          underline: SizedBox(),
          dropdownColor: Colors.white,
          focusColor: Colors.white,
          // Initial Value
          value: dropdownProvider.selectedCategorieValue,

          // Down Arrow Icon
          icon: Padding(
            padding:  EdgeInsets.only(left: widthScreen * 0.13),
            child: const Icon(Icons.keyboard_arrow_down),
          ),

          // Array list of items
          items:
              items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: heightScreen * 0.015,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                );
              }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            setState(() {
               dropdownProvider.selectedCategorieValue = newValue!;
            });
         
          },
        ),
      ),
    );
  }
}