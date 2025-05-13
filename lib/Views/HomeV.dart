import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Views/CategorieV.dart';
import 'package:flutter_application_gestion_stock/Views/Clientv.dart';
import 'package:flutter_application_gestion_stock/Views/CommandV.dart';
import 'package:flutter_application_gestion_stock/Views/produitV.dart';
import 'package:flutter_application_gestion_stock/Views/utilisateurV.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/costumpadding.dart';

class HomeV extends StatefulWidget {
  const HomeV({super.key});

  @override
  State<HomeV> createState() => _HomeVState();
}

class _HomeVState extends State<HomeV> {
  bool istapclient = false;
  bool istapproduit = false;
  bool istapcategorie = false;
  bool istapcommqnde = false;
  bool istaputilisateur = false;
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
