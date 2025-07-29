import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_gestion_stock/Models/Produit.dart';

class Afficherimage extends StatefulWidget {
  final Produit? produit;
  const Afficherimage({super.key, required this.produit});

  @override
  State<Afficherimage> createState() => _AfficherimageState();
}

class _AfficherimageState extends State<Afficherimage> {
  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
     
        SizedBox(
          height: widthScreen * 0.3,
          width: widthScreen * 0.35,
          child: Row(
         
            children: [
          
              SizedBox(width: widthScreen * 0.1),
              Container(
                color: Colors.white,
                width: widthScreen * 0.15,
                height: widthScreen * 0.2,
                child:
                    widget.produit?.image_produit != null
                        ? Image.memory(
                          widget.produit!.image_produit!,
                          fit: BoxFit.cover,
                        )
                        : Icon(
                          Icons.image,
                          size: widthScreen * 0.1,
                          color: Colors.grey,
                        ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            // Refresh the product list
            Navigator.of(context).pop();
          },
    
          // Add your submit logic here
          child: Text("Fermer"),
        ),
      ],
    );
  }
}
