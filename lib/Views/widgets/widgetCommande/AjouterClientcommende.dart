import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_Commande/add_Commande_cubit/add_Commande_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_client/clients_cubit/clients_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_client/cubit_client_conditionnal/client_cubit_conditional.dart';
import 'package:flutter_application_gestion_stock/Models/client.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/ajouterCommandeV.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/decorationtextfield.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/formulestandaire.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/lignelisteV.dart';
import 'package:flutter_application_gestion_stock/provider/clientprovider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Ajouterclientcommende extends StatefulWidget {
  final bool isLoading;
  const Ajouterclientcommende({super.key, required this.isLoading});

  @override
  State<Ajouterclientcommende> createState() => _AjouterclientcommendeState();
}

class _AjouterclientcommendeState extends State<Ajouterclientcommende> {
  final TextEditingController chercheController = TextEditingController();

  Client? clientmodifier;
  @override
  bool select = false;
  @override
  void dispose() {
    chercheController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     final clientProvider = Provider.of<ClientValueProvider>(context);
    final double widthScreen = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;
    return BlocBuilder<ClientsCubit, ClientsState>(
      builder: (context, state) {
        List<Client>? clients = BlocProvider.of<ClientsCubit>(context).clients;
        return BlocBuilder<ClientCubitConditional, ClientCubitConditionalState>(
          builder: (context, state) {
            List<Client>? clientsfltter =
                BlocProvider.of<ClientCubitConditional>(context).clientsfltter;
            return Container(
              alignment: Alignment.topLeft,

              height: heightScreen * 0.8,
              width: widthScreen * 0.25,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child:
                  widget.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: heightScreen * 0.01),
                            Text(
                              "Client",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: widthScreen * 0.02,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: heightScreen * 0.01),
                            SizedBox(
                              height: widthScreen * 0.04,
                              width: widthScreen * 0.15,

                              child: Padding(
                                padding: EdgeInsets.all(widthScreen * 0.01),
                                child: TextFormField(
                                  controller: chercheController,
                                  keyboardType: TextInputType.text,

                                  decoration: decorationTextfield.copyWith(
                                    hintText: "          Recherche      ",
                                    suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.search,
                                        size: widthScreen * 0.01,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    BlocProvider.of<ClientCubitConditional>(
                                      context,
                                    ).fetchClientsfilter(value, "nom_client");
                                  },
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: widthScreen * 0.02,
                                right: widthScreen * 0.025,
                              ),
                              color: Colors.white,
                              height: widthScreen * 0.002,
                              width: widthScreen * 0.8,
                            ),
                            SizedBox(height: heightScreen * 0.01),
                            Lignelistev(
                              color: true,
                              listtitle: [
                                "id",
                                "Nom",
                                "Prenom",
                                "email",
                                "phone",
                                "ville",
                              ],
                              colorselected: false,
                              val: widthScreen * 0.47,
                            ),
                            SizedBox(
                              height: heightScreen * 0.60,
                              width: widthScreen * 0.25,

                              child: ListView.builder(
                                itemCount:
                                    chercheController.text.isEmpty
                                        ? clients?.length ?? 0
                                        : clientsfltter?.length ?? 0,
                                itemBuilder: (context, index) {
                                  final client =
                                      chercheController.text.isEmpty
                                          ? clients![index]
                                          : clientsfltter![index];
                                  List clientList = [
                                    client.id_client ?? '',
                                    client.name_client ?? '',
                                    client.Prenom_client ?? '',
                                    client.email_client ?? '',
                                    client.phone_client ?? '',
                                    client.ville_client ?? '',
                                  ];
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        select = !select!;
                                        clientmodifier = client;
                                      });
                                         setState(() {
         clientProvider.clientValue  = clientmodifier!;
            });
                                      Navigator.of(context).pop();
                                   
                                    },
                                    child: Lignelistev(
                                      color: false,
                                      listtitle: clientList,
                                      colorselected:
                                          clientmodifier == client
                                              ? true
                                              : false,
                                      val: widthScreen * 0.47,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
            );
          },
        );
      },
    );
  }
}
