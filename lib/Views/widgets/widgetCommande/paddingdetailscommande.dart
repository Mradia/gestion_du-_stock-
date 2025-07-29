import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_gestion_stock/Models/Produit.dart';

Padding paddingDetailsCommande({
  required double widthScreen,
  required double heightScreen,String? produitchoiser,String? title 
}) {
  return        Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: widthScreen * 0.01,
                          vertical: heightScreen * 0.04,
                      
                        ),
                        child: Row(
                          children: [
                            Text(title!,
                              style: TextStyle(
                                color: const Color.fromARGB(255, 18, 214, 4),
                                fontSize: widthScreen * 0.010,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(width: widthScreen * 0.01),
                            Text(produitchoiser!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: widthScreen * 0.007,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                       
                       );
}