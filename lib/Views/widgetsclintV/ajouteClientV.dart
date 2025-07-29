import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_client/add_client_cubit/add_client_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_client/clients_cubit/clients_cubit.dart';
import 'package:flutter_application_gestion_stock/Models/client.dart';

import 'package:flutter_application_gestion_stock/Views/widgets/textfieldformule.dart';
import 'package:flutter_application_gestion_stock/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Make sure idClient is not const in main.dart, it should be:
// int idClient = 0;

class Ajouteclientv extends StatefulWidget {
  final double widthScreen;

  const Ajouteclientv({
    super.key,
    required this.widthScreen,
    required bool isLoading, 
  });

  @override
  State<Ajouteclientv> createState() => _AjouteclientvState();
}

class _AjouteclientvState extends State<Ajouteclientv> {
  final TextEditingController nomclientController = TextEditingController();
  final TextEditingController prenomclientController = TextEditingController();
  final TextEditingController emailclientController = TextEditingController();
  final TextEditingController villeclientController = TextEditingController();
  final TextEditingController telclientController = TextEditingController();
  final TextEditingController adressclientController = TextEditingController();
  final TextEditingController payclientController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    nomclientController.dispose();
    prenomclientController.dispose();
    emailclientController.dispose();
    villeclientController.dispose();
    telclientController.dispose();
    adressclientController.dispose();
    payclientController.dispose();
    // Dispose of all controllers to free up resources
    // You can also call super.dispose() if you have a superclass that needs to be disposed

    super.dispose();
  }

  String? nomclient,
      prenomclient,
      emailclient,
      villeclient,
      telclient,
      adressclient,
      payclient;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddClientCubit, AddClientState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: widget.widthScreen * 0.35,
                  width: widget.widthScreen * 0.2,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nomclientController,
                        decoration: getInputDecoration(
                          "Nom Client",
                          Icons.person,
                          widget.widthScreen * 0.01,
                        ),
                         style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer le nom du client';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          nomclient = value;
                        },
                      ),

                      SizedBox(height: widget.widthScreen * 0.02),

                      TextFormField(
                          style: TextStyle(color: Colors.white),
                        controller: adressclientController,
                        decoration: getInputDecoration(
                          "Adress Client",
                          Icons.location_on,
                          widget.widthScreen * 0.01,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer l adresse du client';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          adressclient = value;
                        },
                      ),
                      SizedBox(height: widget.widthScreen * 0.02),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: payclientController,
                        decoration: getInputDecoration(
                          "Pay Client",
                          Icons.location_city,
                          widget.widthScreen * 0.01,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer le Pay du client';
                          }
                          return null;
                        },
                        onSaved: (value) {
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
                        controller: prenomclientController,
                        decoration: getInputDecoration(
                          "Prenom Client",
                          Icons.person,
                          widget.widthScreen * 0.01,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer le prenom du client';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          prenomclient = value;
                        },
                      ),
                      SizedBox(height: widget.widthScreen * 0.02),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: telclientController,
                        decoration: getInputDecoration(
                          "le teléphone du client",
                          Icons.phone,
                          widget.widthScreen * 0.01,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer le teléphone du client';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          telclient = value;
                        },
                      ),
                      SizedBox(height: widget.widthScreen * 0.02),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: emailclientController,
                        decoration: getInputDecoration(
                          "Email Client",
                          Icons.email,
                          widget.widthScreen * 0.01,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer l email du client';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          emailclient = value;
                        },
                      ),
                      SizedBox(height: widget.widthScreen * 0.02),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: villeclientController,
                        decoration: getInputDecoration(
                          "ville Client",
                          Icons.location_city,
                          widget.widthScreen * 0.01,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer la ville du client';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          villeclient = value;
                        },
                      ),
                      SizedBox(height: widget.widthScreen * 0.05),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            Client newClient = Client(
                              id_client:
                                  uuidclient
                                      .v1(), // Generate a unique ID for the client

                              name_client: nomclient,
                              email_client: emailclient,
                              phone_client: telclient,
                              address_client: adressclient,
                              ville_client: villeclient,
                              Prenom_client: prenomclient,
                              Pays_client: payclient,
                              list_commande: [],
                            );
                            // Add the new client to the Hive box
                            //    clientBox.add(newClient);
                            // Clear the text fields
                            nomclientController.clear();
                            prenomclientController.clear();
                            emailclientController.clear();
                            villeclientController.clear();
                            telclientController.clear();
                            adressclientController.clear();
                            payclientController.clear();
                            // Optionally, you can show a success message or navigate to another screen
                            print("Client ajouté: ${newClient.toJson()}");
                            BlocProvider.of<AddClientCubit>(
                              context,
                            ).addClient(newClient);

                            BlocProvider.of<ClientsCubit>(
                              context,
                            ).fetchClients();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Client ajouté avec succès'),
                              ),
                            );
                            Navigator.of(context).pop();
                           
                            print(
                              "Client ajoutéeeeeeeeeeeee: ${newClient.toJson()}",
                            );
                            setState(() {});
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                          
                          }
                        },

                        // Add your submit logic here
                        child: Text("Ajouter"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
