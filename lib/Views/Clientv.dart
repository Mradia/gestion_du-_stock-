import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_client/add_client_cubit/add_client_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_client/clients_cubit/clients_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_client/cubit_client_conditionnal/client_cubit_conditional.dart';
import 'package:flutter_application_gestion_stock/Models/client.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/decorationtextfield.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/dropdown.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/formulestandaire.dart';
import 'package:flutter_application_gestion_stock/Views/widgetsclintV/AjouteClientV.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/lignelisteV.dart';
import 'package:flutter_application_gestion_stock/Views/widgetsclintV/container.dart';
import 'package:flutter_application_gestion_stock/Views/widgetsclintV/modifierclientv.dart';
import 'package:flutter_application_gestion_stock/provider/valeur.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Clientv extends StatefulWidget {

  const Clientv({super.key});

  @override
  State<Clientv> createState() => _ClientvState();
}

class _ClientvState extends State<Clientv> {
  final TextEditingController chercheController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    chercheController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    BlocProvider.of<ClientsCubit>(context).fetchClients();
    chercheController.addListener(() {
      // You can access the current value with chercheController.text
      // For example, trigger a search/filter in your cubit:
    });

    chercheController.addListener(showUser);
    super.initState();
  }

  Color colorselected = Colors.transparent;
  bool? select;

  Client? clientmodifier;
  List clientListmod = [];
  showUser() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final dropdownProvider = Provider.of<DropdownValueProvider>(context);
    select = false;
    final double widthScreen = MediaQuery.of(context).size.width;
    final double hScreen = MediaQuery.of(context).size.height;
    return BlocBuilder<ClientsCubit, ClientsState>(
      builder: (context, state) {
        List<Client>? clients = BlocProvider.of<ClientsCubit>(context).clients;
        return BlocBuilder<ClientCubitConditional, ClientCubitConditionalState>(
          builder: (context, state) {
            List<Client>? clientsfilters =
                BlocProvider.of<ClientCubitConditional>(context).clientsfltter;
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: widthScreen * 0.05),
                  Row(
                    children: [
                      SizedBox(width: widthScreen * 0.08),
                      BlocProvider(
                        create: (context) => AddClientCubit(),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              select = true;
                            });

                            select == true
                                ? showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return BlocProvider(
                                      create: (context) => AddClientCubit(),
                                      child: BlocBuilder<
                                        AddClientCubit,
                                        AddClientState
                                      >(
                                        builder:
                                            (
                                              context,
                                              state,
                                            ) => Formulestandaire(
                                              widthScreen: widthScreen,
                                              text: "Ajouter Client",
                                              classtype: Ajouteclientv(
                                                isLoading:
                                                    state is AddClientLoading
                                                        ? true
                                                        : false,
                                                widthScreen: widthScreen,
                                              ),
                                            ),
                                      ),
                                    );
                                  },
                                )
                                : null;
                          },
                          child: ContainerBot(
                            image: "asset/icons8-add-64.png",
                            text: "Ajouter",
                          ),
                        ),
                      ),
                      SizedBox(width: widthScreen * 0.04),
                      GestureDetector(
                        onTap: () {
                          if (clientmodifier != null) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Formulestandaire(
                                  widthScreen: widthScreen,
                                  text: "Modifier Client",
                                  classtype: Modifierclientv(
                                    widthScreen: widthScreen,
                                    newClient: clientmodifier!,
                                  ),
                                );
                              },
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Veuillez sélectionner un client.",
                                ),
                              ),
                            );
                          }
                        },
                        child: ContainerBot(
                          image: "asset/icons8-recycle-64.png",
                          text: "Modifier",
                        ),
                      ),
                      SizedBox(width: widthScreen * 0.04),
                      GestureDetector(
                        onTap: () {
                          if (clientmodifier != null) {
                            clientmodifier!.delete();
                            BlocProvider.of<ClientsCubit>(
                              context,
                            ).fetchClients();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Veuillez sélectionner un client.",
                                ),
                              ),
                            );
                          }
                        },
                        child: ContainerBot(
                          image: "asset/icons8-close-94.png",
                          text: "Suprimer",
                        ),
                      ),
                      SizedBox(width: widthScreen * 0.03),
                    ],
                  ),
                  SizedBox(height: widthScreen * 0.005),
                  Container(
                    margin: EdgeInsets.only(
                      left: widthScreen * 0.06,
                      right: widthScreen * 0.035,
                    ),
                    color: Colors.black,
                    height: widthScreen * 0.002,
                    width: widthScreen * 0.66,
                  ),
                  SizedBox(height: widthScreen * 0.005),
                  Row(
                    children: [
                      DropdownV(),
                      SizedBox(width: widthScreen * 0.05),
                      SizedBox(
                        height: widthScreen * 0.05,
                        width: widthScreen * 0.2,

                        child: Padding(
                          padding: EdgeInsets.all(widthScreen * 0.01),
                          child: TextFormField(
                            controller: chercheController,
                            keyboardType: TextInputType.text,

                            decoration: decorationTextfield.copyWith(
                              hintText: "          Recherche      ",
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.search),
                              ),
                            ),
                            onChanged:
                                (value) =>
                                    BlocProvider.of<ClientCubitConditional>(
                                      context,
                                    ).fetchClientsfilter(
                                      value,
                                      dropdownProvider.dropdownValue,
                            
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: widthScreen * 0.005),
                  Container(
                    margin: EdgeInsets.only(
                      left: widthScreen * 0.06,
                      right: widthScreen * 0.035,
                    ),
                    color: Colors.black,
                    height: widthScreen * 0.002,
                    width: widthScreen * 0.66,
                  ),
                  SizedBox(height: widthScreen * 0.009),
                  Lignelistev(
                    color: true,
                    listtitle: [
                      "id",
                      "Nom",
                      "Prenom",
                      "Adresse",
                      "Telephone",
                      "Email",
                      "Pays",
                      "Ville",
                    ],
                    colorselected: false,
                    val: widthScreen * 0.75,
                  ),

                  SizedBox(
                    height: hScreen * 0.60,
                    width: widthScreen * 0.75,
                    child: ListView.builder(
                      itemCount:
                          dropdownProvider.dropdownValue == 'All'
                              ? clients?.length
                              : clientsfilters?.length ?? 0,
                      itemBuilder: (context, index) {
                        final client =
                            dropdownProvider.dropdownValue == 'All'
                                ? clients![index]
                                : clientsfilters![index];
                        List clientList = [
                          client.id_client.toString(),
                          client.name_client ?? '',
                          client.Prenom_client ?? '',
                          client.address_client ?? '',
                          client.phone_client ?? '',
                          client.email_client ?? '',
                          client.Pays_client ?? '',
                          client.ville_client ?? '',
                        ];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              select = !select!;
                              clientmodifier = client;
                            });
                          },
                          child: Lignelistev(
                            color: false,
                            listtitle: clientList,
                            colorselected:
                                clientmodifier == client ? true : false,
                            val: widthScreen * 0.75,
                          ),
                        );
                      },
                    ) 
                         
                               
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
