import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Models/client.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/widgetCommande/AjouterClientcommende.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/widgetCommande/containerCommande.dart';

Container containerclient(
  double widthScreen,
  double heightScreen,
  bool isLoading,
  Client? clientmodifier,
  context,
) {
  return Container(
    alignment: Alignment.topLeft,

    height: heightScreen * 0.15,
    width: widthScreen * 0.425,
    decoration: BoxDecoration(
      color: Colors.black,
      border: Border.all(color: Colors.white, width: 2),
    ),
    child: Column(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    title: Container(
                      color: Colors.white,
                      width: widthScreen * 0.25,
                      height: heightScreen * 0.05,

                      child: Padding(
                        padding: EdgeInsets.all(widthScreen * 0.006),
                        child: Text(
                          'Client',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: widthScreen * 0.01,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    content: Ajouterclientcommende(isLoading: isLoading),

                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('OK'),
                      ),
                    ],
                    backgroundColor: Colors.black54,
                  ),
            );
            // Update the state if needed (setState removed because it's not available here)
          },
          child: SizedBox(
            height: heightScreen * 0.05,

            child: Row(
              children: [
                Text(
                  '  Client  ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widthScreen * 0.015,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.ads_click_sharp,
                  color: Colors.white,
                  size: widthScreen * 0.015,
                ),
              ],
            ),
          ),
        ),

        SizedBox(
          height: heightScreen * 0.04,
          width: widthScreen * 0.425,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(widthScreen * 0.007),
                child: Text(
                  "Nom :",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widthScreen * 0.007,
                  ),
                ),
              ),
              contain(
                widthScreen,
                heightScreen,
                clientmodifier?.name_client ?? "",
              ),
              Padding(
                padding: EdgeInsets.all(widthScreen * 0.007),
                child: Text(
                  "Prenom :",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widthScreen * 0.007,
                  ),
                ),
              ),
              contain(
                widthScreen,
                heightScreen,
                clientmodifier?.Prenom_client ?? "",
              ),
              Padding(
                padding: EdgeInsets.all(widthScreen * 0.007),
                child: Text(
                  "Telephone :",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widthScreen * 0.007,
                  ),
                ),
              ),
              contain(
                widthScreen,
                heightScreen,
                clientmodifier?.phone_client ?? "",
              ),
            ],
          ),
        ),
        SizedBox(
          height: heightScreen * 0.05,
          width: widthScreen * 0.425,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(widthScreen * 0.007),
                child: Text(
                  "Email :",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widthScreen * 0.007,
                  ),
                ),
              ),
              contain(
                widthScreen,
                heightScreen,
                clientmodifier?.email_client ?? "",
              ),
              Padding(
                padding: EdgeInsets.all(widthScreen * 0.007),
                child: Text(
                  "Pays :",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widthScreen * 0.007,
                  ),
                ),
              ),
              contain(
                widthScreen,
                heightScreen,
                clientmodifier?.Pays_client ?? "",
              ),

              Padding(
                padding: EdgeInsets.all(widthScreen * 0.007),
                child: Text(
                  "Ville :",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widthScreen * 0.007,
                  ),
                ),
              ),
              contain(
                widthScreen,
                heightScreen,
                clientmodifier?.ville_client ?? "",
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
