import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_Commande/Commandes_cubit/commandes_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_Commande/add_Commande_cubit/add_Commande_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_client/cubit_client_conditionnal/client_cubit_conditional.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_details_commandes/cubit_DetailsCommades_conditionnal/detailsCommades_cubit_conditional.dart';
import 'package:flutter_application_gestion_stock/Models/client.dart';
import 'package:flutter_application_gestion_stock/Models/commande.dart';
import 'package:flutter_application_gestion_stock/Models/details_commades.dart';
import 'package:flutter_application_gestion_stock/Views/HomeV.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/costumeelevateubutton.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/widgetCommande/containerClient.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/widgetCommande/containerProduit.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/widgetCommande/containerafficherCommande.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/widgetCommande/rowhttva.dart';
import 'package:flutter_application_gestion_stock/provider/clientprovider.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';

class AjouterCommandeV extends StatefulWidget {
  final String? id_Commende;
  final Client? clientmodifier;
  final bool isLoading;
  const AjouterCommandeV({
    super.key,
    required this.isLoading,
    this.clientmodifier,
    required this.id_Commende,
  });

  @override
  State<AjouterCommandeV> createState() => _AjouterCommandeVState();
}

class _AjouterCommandeVState extends State<AjouterCommandeV> {
  DateTime? _selectedDate = DateTime.now();

  @override
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          (_selectedDate ??
              DateTime.now()), // التاريخ الأولي هو التاريخ المختار سابقاً أو تاريخ اليوم
      firstDate: DateTime(2000), // أقدم تاريخ يمكن اختياره
      lastDate: DateTime(2101), // أحدث تاريخ يمكن اختياره
      helpText: 'choiser une date', // نص مساعد يظهر في الأعلى
      cancelText: 'Annuler', // نص زر الإلغاء
      confirmText: 'Confirmer', // نص زر التأكيد
    );

    // إذا اختار المستخدم تاريخاً
    if (picked != null && (picked != _selectedDate)) {
      setState(() {
        _selectedDate = picked;

        // تحديث المتغير بالتاريخ الجديد
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<ClientCubitConditional>(context).fetchClientsfilter(
      widget.clientmodifier?.name_client ?? "",
      "nom_client",
    );
    BlocProvider.of<DetailsCommadesCubitConditional>(
      context,
    ).fetchDetailsCommadesfilter(widget.id_Commende ?? "");

    BlocProvider.of<DetailsCommadesCubitConditional>(
      context,
    ).detailsCommadesfltter;

    super.initState();
  }

  double tOTAL_HT = 0.0;

  double tOTAL_TTC = 0.0;
  calculer(List<DetailsCommades> detailsCommadesfilters, double tva) {
    setState(() {
      tOTAL_HT = 0;
    });

    // Vérifie que la liste n'est pas nulle
    if (detailsCommadesfilters != null) {
      for (var details in detailsCommadesfilters) {
        tOTAL_HT += details.total ?? 0;
      }
    }

    setState(() {
      tOTAL_TTC = tOTAL_HT * (1 + (tva / 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;
    final clientProvider = Provider.of<ClientValueProvider>(context);
    return BlocBuilder<
      DetailsCommadesCubitConditional,
      DetailsCommadesCubitConditionalState
    >(
      builder: (context, state) {
        List<DetailsCommades>? detailsCommadesfilters =
            BlocProvider.of<DetailsCommadesCubitConditional>(
              context,
            ).detailsCommadesfltter;

        return Row(
          children: [
            SizedBox(width: widthScreen * 0.02),
            Containerproduit(
              isLoading: widget.isLoading,
              id_Commende: clientProvider.idCommandeValue,
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,

                  height: heightScreen * 0.8,
                  width: widthScreen * 0.44,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white, width: 2),
                  ),

                  child:
                      widget.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: widthScreen * 0.005,
                                  top: heightScreen * 0.01,
                                ),
                                child: containerclient(
                                  widthScreen,
                                  heightScreen,
                                  widget.isLoading,
                                  clientProvider.clientValue,
                                  context,
                                ),
                              ),
                              SizedBox(height: heightScreen * 0.01),
                              Row(
                                children: [
                                  SizedBox(width: widthScreen * 0.12),
                                  Text(
                                    "  Date Commande :  ",
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                        255,
                                        5,
                                        173,
                                        11,
                                      ),
                                      fontSize: widthScreen * 0.012,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _selectDate(context);
                                    },
                                    child: Container(
                                      //    color: const Color.fromARGB(183, 217, 217, 217),
                                      width: widthScreen * 0.1,
                                      decoration: BoxDecoration(
                                        color:
                                            Colors
                                                .lightBlue[50], // Background color of the container
                                        // Border.all creates a border on all sides
                                        border: Border.all(
                                          color: Colors.black, // Border color
                                          width:
                                              widthScreen *
                                              0.0002, // Border width
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "  ${DateFormat('d MMMM y').format(_selectedDate!)}",
                                          ),
                                          Spacer(),
                                          Icon(Icons.calendar_month),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Containeraffichercommande(
                                isLoading: widget.isLoading,
                                listDetailsCommades: [],
                                detailsCommadesfilters: detailsCommadesfilters,
                                id_commande: clientProvider.idCommandeValue,
                              ),
                              Rowtvattc(
                                tVA: clientProvider.tVa,
                                isLoading: widget.isLoading,
                                detailsCommadesfilters: detailsCommadesfilters!,
                              ),

                              ElevatedButton(
                                onPressed: () {
                                  calculer(
                                    detailsCommadesfilters,
                                    clientProvider.tVa,
                                  );
                                  Commande newCommande = Commande(
                                    id_commande: widget.id_Commende,
                                    date_commande:
                                        _selectedDate != null
                                            ? DateFormat(
                                              'yyyy-MM-dd',
                                            ).format(_selectedDate!)
                                            : null,
                                    id_client:
                                        clientProvider.clientValue.id_client,
                                    tVA: clientProvider.tVa,
                                    total_Ht:
                                        tOTAL_HT, // Initialize with 0, will be updated later
                                    total_TTC: tOTAL_TTC,
                                    list_Clients: [],
                                    list_details_commande:
                                        detailsCommadesfilters,

                                    // Generate a unique ID for the client
                                  );
                                  // Add the new client to the Hive box
                                  //    clientBox.add(newClient);
                                  // Clear the text fields

                                  // Optionally, you can show a success message or navigate to another screen
                                  print(
                                    "Commande ajouté: ${newCommande.toJson()}",
                                  );
                                  BlocProvider.of<AddCommandeCubit>(
                                    context,
                                  ).addClient(newCommande);

                                  BlocProvider.of<CommandesCubit>(
                                    context,
                                  ).fetchCommandes();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Commande ajouté avec succès',
                                      ),
                                    ),
                                  );

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => HomeV(
                                            istapclient: false,
                                            istapcategorie: false,
                                            istapproduit: false,
                                            istapcommqnde: true,
                                            istaputilisateur: false,
                                          ),
                                    ),
                                  );
                                  print(
                                    "Commande ajoutéeeeeeeeeeeee: ${newCommande.toJson()}",
                                  );
                                },

                                // Add your submit logic here
                                child: Text("Ajouter"),
                              ),
                            ],
                          ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
