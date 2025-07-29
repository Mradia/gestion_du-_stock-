import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_client/clients_cubit/clients_cubit.dart';
import 'package:flutter_application_gestion_stock/Views/CategorieV.dart';
import 'package:flutter_application_gestion_stock/Views/Clientv.dart';
import 'package:flutter_application_gestion_stock/Views/CommandV.dart';
import 'package:flutter_application_gestion_stock/Views/produitV.dart';
import 'package:flutter_application_gestion_stock/Views/utilisateurV.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/costumpadding.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeV extends StatefulWidget {
  final bool? istapclient;
  final bool? istapproduit;
  final bool? istapcategorie;
  final bool? istapcommqnde;
  final bool? istaputilisateur;
  const HomeV({
    super.key,
    required this.istapclient,
    required this.istapproduit,
    required this.istapcategorie,
    required this.istapcommqnde,
    required this.istaputilisateur,
  });

  @override
  State<HomeV> createState() => _HomeVState();
}

class _HomeVState extends State<HomeV> {
  late bool istapclient;
  late bool istapproduit;
  late bool istapcategorie;
  late bool istapcommqnde;
  late bool istaputilisateur;

  @override
  void initState() {
    super.initState();
    istapclient = widget.istapclient!;
    istapproduit = widget.istapproduit!;
    istapcategorie = widget.istapcategorie!;
    istapcommqnde = widget.istapcommqnde!;
    istaputilisateur = widget.istaputilisateur!;
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 249, 248),
      body: Row(
        children: [
          Container(
            width: widthScreen * 0.2,
            height: double.infinity,
            color: Colors.black,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        istapclient = true;
                        istapcategorie = false;
                        istapproduit = false;
                        istapcommqnde = false;
                        istaputilisateur = false;
                      });
                    },
                    child: Costumpadding(
                      iconPath: "asset/icons8-person-94.png",
                      istap: istapclient,
                      text: 'Client',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        istapclient = false;
                        istapcategorie = false;
                        istapproduit = true;
                        istapcommqnde = false;
                        istaputilisateur = false;
                      });
                    },
                    child: Costumpadding(
                      iconPath: "asset/icons8-cart-48.png",
                      istap: istapproduit,
                      text: 'Produit',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        
                        istapclient = false;
                        istapcategorie = true;
                        istapproduit = false;
                        istapcommqnde = false;
                        istaputilisateur = false;
                      });
                    },
                    child: Costumpadding(
                      iconPath: "asset/icons8-categorize-48.png",
                      istap: istapcategorie,
                      text: 'Categorie',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                       
                        istapclient = false;
                        istapcategorie = false;
                        istapproduit = false;
                        istapcommqnde = true;
                        istaputilisateur = false;
                      });
                    },
                    child: Costumpadding(
                      iconPath: "asset/icons8-shopping-basket-100.png",
                      istap: istapcommqnde,
                      text: 'Commande',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                      
                        istapclient = false;
                        istapcategorie = false;
                        istapproduit = false;
                        istapcommqnde = false;
                        istaputilisateur = true;
                      });
                    },
                    child: Costumpadding(
                      iconPath: "asset/icons8-account-64.png",
                      istap: istaputilisateur,
                      text: 'Utilisateur',
                    ),
                  ),
                ],
              ),
            ),
          ),
       
          istapcategorie
              ? Categoriev()
              : istapclient
              ? Clientv()
              : istapcommqnde
              ? Commandv()
              : istapproduit
              ? Produitv()
              : istaputilisateur
              ? AuthV()
              : Text("chooooooooooooooooose one "),
        ],
      ),
    );
  }
}
