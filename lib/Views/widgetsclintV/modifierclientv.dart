import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_client/clients_cubit/clients_cubit.dart';
import 'package:flutter_application_gestion_stock/Models/client.dart';

import 'package:flutter_application_gestion_stock/Views/HomeV.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/textfieldformule.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Modifierclientv extends StatefulWidget {
  final double widthScreen;
  final Client newClient;
  const Modifierclientv({
    super.key,
    required this.widthScreen,
    required this.newClient,
  });

  @override
  State<Modifierclientv> createState() => _ModifierclientvState();
}

class _ModifierclientvState extends State<Modifierclientv> {
  String? nomclient,
      prenomclient,
      emailclient,
      villeclient,
      telclient,
      adressclient,
      payclient;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: widget.widthScreen * 0.35,
            width: widget.widthScreen * 0.2,
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: getInputDecoration(
                    widget.newClient.name_client ?? "Nom Client",
                    Icons.person,
                    widget.widthScreen * 0.01,
                  ),
                  onChanged: (value) {
                    nomclient = value;
                  },
                ),

                SizedBox(height: widget.widthScreen * 0.02),

                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: getInputDecoration(
                    widget.newClient.address_client ?? "Adresse Client",
                    Icons.location_on,
                    widget.widthScreen * 0.01,
                  ),
                  onChanged: (value) {
                    adressclient = value;
                  },
                ),
                SizedBox(height: widget.widthScreen * 0.02),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: getInputDecoration(
                    widget.newClient.Pays_client ?? "Pay Client",
                    Icons.location_city,
                    widget.widthScreen * 0.01,
                  ),
                  onChanged: (value) {
                    payclient = value;
                  },
                ),

                SizedBox(height: widget.widthScreen * 0.02),
              ],
            ),
          ),
          SizedBox(width: widget.widthScreen * 0.02),
          SizedBox(
            height: widget.widthScreen * 0.35,
            width: widget.widthScreen * 0.2,
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: getInputDecoration(
                    widget.newClient.Prenom_client ?? "Prenom Client",
                    Icons.person,
                    widget.widthScreen * 0.01,
                  ),
                  onChanged: (value) {
                    prenomclient = value;
                  },
                ),
                SizedBox(height: widget.widthScreen * 0.02),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: getInputDecoration(
                    widget.newClient.phone_client ?? "Tel Client",
                    Icons.phone,
                    widget.widthScreen * 0.01,
                  ),
                  onChanged: (value) {
                    telclient = value;
                  },
                ),
                SizedBox(height: widget.widthScreen * 0.02),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: getInputDecoration(
                    widget.newClient.email_client ?? "Email Client",
                    Icons.email,
                    widget.widthScreen * 0.01,
                  ),
                  onChanged: (value) {
                    emailclient = value;
                  },
                ),
                SizedBox(height: widget.widthScreen * 0.02),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: getInputDecoration(
                    widget.newClient.ville_client ?? "Ville Client",
                    Icons.location_city,
                    widget.widthScreen * 0.01,
                  ),
                  onChanged: (value) {
                    villeclient = value;
                  },
                ),
                SizedBox(height: widget.widthScreen * 0.1),
                ElevatedButton(
                  onPressed: () {
                  widget.newClient.name_client = nomclient?? widget.newClient.name_client;
                  widget.newClient.Prenom_client = prenomclient?? widget.newClient.Prenom_client;
                  widget.newClient.address_client = adressclient?? widget.newClient.address_client;
                  widget.newClient.Pays_client = payclient?? widget.newClient.Pays_client;
                  widget.newClient.phone_client = telclient?? widget.newClient.phone_client;
                  widget.newClient.email_client = emailclient?? widget.newClient.email_client;
                  widget.newClient.ville_client = villeclient?? widget.newClient.ville_client;
                  widget.newClient.save();
                  BlocProvider.of<ClientsCubit>(context).fetchClients();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Client modifié avec succès"),
                   
                    ),
                  );
             Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (context) => HomeV(
                   istapclient: true,
                   istapproduit: false,
                   istapcategorie: false,
                   istapcommqnde: false,
                   istaputilisateur: false,
                 ),
               ),
             );



                  },

                  // Add your submit logic here
                  child: Text("Modifier"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
