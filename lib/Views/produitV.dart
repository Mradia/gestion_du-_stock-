import 'package:flutter/material.dart';

class Produitv extends StatefulWidget {
  const Produitv({super.key});

  @override
  State<Produitv> createState() => _ProduitvState();
}

class _ProduitvState extends State<Produitv> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 50, width: 50, child: Text("data"));
  }
}