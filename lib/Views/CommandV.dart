import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_Commande/Commandes_cubit/commandes_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_Commande/add_Commande_cubit/add_Commande_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_Commande/cubit_Commande_conditionnal/commande_cubit_conditional.dart';

import 'package:flutter_application_gestion_stock/Cubits/cubit_client/cubit_getClientbyid_conditionnal/clientbyid_cubit_conditional.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_details_commandes/cubit_DetailsCommades_conditionnal/detailsCommades_cubit_conditional.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_details_commandes/detailsCommades_cubit/detailsCommades_cubit.dart';
import 'package:flutter_application_gestion_stock/Models/client.dart';

import 'package:flutter_application_gestion_stock/Models/commande.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/ajouterCommandeV.dart';

import 'package:flutter_application_gestion_stock/Views/widgets/formulestandaire.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/lignelisteV.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/widgetCommande/ImpremerCommande.dart';
import 'package:flutter_application_gestion_stock/Views/widgetsclintV/container.dart';
import 'package:flutter_application_gestion_stock/Views/widgetsproduct/sauvgarderExcel.dart';
import 'package:flutter_application_gestion_stock/main.dart';
import 'package:flutter_application_gestion_stock/provider/clientprovider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Commandv extends StatefulWidget {
  // Add this line to define clientmodifier
  const Commandv({super.key});

  @override
  State<Commandv> createState() => _CommandvState();
}

class _CommandvState extends State<Commandv> {
  bool select = false;
  dynamic clientmodifier; // Add this line to define clientmodifier

  DateTime? _selectedDate = DateTime.now();
  DateTime? _selectedDate1 = DateTime.now();

  // دالة لعرض أداة اختيار التاريخ وتحديث الحالة
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

  Future<void> _selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          (_selectedDate1 ??
              DateTime.now()), // التاريخ الأولي هو التاريخ المختار سابقاً أو تاريخ اليوم
      firstDate: DateTime(2000), // أقدم تاريخ يمكن اختياره
      lastDate: DateTime(2101), // أحدث تاريخ يمكن اختياره
      helpText: 'choiser une date', // نص مساعد يظهر في الأعلى
      cancelText: 'Annuler', // نص زر الإلغاء
      confirmText: 'Confirmer', // نص زر التأكيد
    );

    // إذا اختار المستخدم تاريخاً
    if (picked != null && (picked != _selectedDate1)) {
      setState(() {
        _selectedDate1 = picked;

        // تحديث المتغير بالتاريخ الجديد
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    /*  BlocProvider.of<CommandeCubitConditional>(context).fetchCommandesfilter(
      DateFormat('yyyy-MM-dd').format(_selectedDate!),
      DateFormat('yyyy-MM-dd').format(_selectedDate1!),
    );*/
    super.initState();
  }

  Commande? commandemodifier;
  @override
  Widget build(BuildContext context) {
    final clientProvider = Provider.of<ClientValueProvider>(context);

    select = false;
    final double widthScreen = MediaQuery.of(context).size.width;
    final double hScreen = MediaQuery.of(context).size.height;
    return BlocBuilder<CommandesCubit, CommandesState>(
      builder: (context, state) {
        List<Commande>? commandes =
            BlocProvider.of<CommandesCubit>(context).commandes;
        return BlocBuilder<
          CommandeCubitConditional,
          CommandeCubitConditionalState
        >(
          builder: (context, state) {
            List<Commande>? commandesfilters =
                BlocProvider.of<CommandeCubitConditional>(
                  context,
                ).commandesfltter;

            return BlocBuilder<
              ClientidCubitConditional,
              ClientidCubitConditionalState
            >(
              builder: (context, state) {
                List<Client>? clientidfilters =
                    BlocProvider.of<ClientidCubitConditional>(
                      context,
                    ).clientsidfltter;

                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: widthScreen * 0.05),
                      Row(
                        children: [
                          SizedBox(width: widthScreen * 0.08),
                          BlocProvider(
                            create: (context) => AddCommandeCubit(),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  select = true;
                                });

                                setState(() {
                                  clientProvider.idCommandeValue =
                                      uidCommade.v1();
                                  clientProvider.clientValue = Client(
                                    id_client: '',
                                    name_client: '',
                                    Prenom_client: '',
                                    email_client: '',
                                    phone_client: '',
                                    ville_client: '',
                                    address_client: '',
                                    Pays_client: '',
                                    list_commande: [],
                                  );
                                });

                                select == true
                                    ? showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return BlocProvider(
                                          create:
                                              (context) => AddCommandeCubit(),
                                          child: BlocBuilder<
                                            AddCommandeCubit,
                                            AddCommandeState
                                          >(
                                            builder:
                                                (
                                                  context,
                                                  state,
                                                ) => BlocProvider(
                                                  create:
                                                      (context) =>
                                                          DetailsCommadesCubitConditional(),
                                                  child: BlocBuilder<
                                                    DetailsCommadesCubitConditional,
                                                    DetailsCommadesCubitConditionalState
                                                  >(
                                                    builder:
                                                        (
                                                          context,
                                                          state,
                                                        ) => Formulestandaire(
                                                          widthScreen:
                                                              widthScreen / 0.7,
                                                          text:
                                                              "Ajouter Commande",
                                                          classtype: AjouterCommandeV(
                                                            isLoading:
                                                                state
                                                                        is AddCommandeLoading
                                                                    ? true
                                                                    : false,
                                                            clientmodifier:
                                                                clientProvider
                                                                    .clientValue,
                                                            id_Commende:
                                                                clientProvider
                                                                    .idCommandeValue,
                                                          ),
                                                        ),
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
                          Row(
                            children: [
                              Text(
                                "          Date Début :  ",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 34, 98, 36),
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
                                          widthScreen * 0.0002, // Border width
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
                              Text(
                                "          Date Fin :  ",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 242, 46, 7),
                                  fontSize: widthScreen * 0.012,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _selectDate1(context);
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
                                          widthScreen * 0.0002, // Border width
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "  ${DateFormat('d MMMM y').format(_selectedDate1!)}",
                                      ),
                                      Spacer(),
                                      Icon(Icons.calendar_month),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: widthScreen * 0.02),
                          IconButton(
                            color: const Color.fromARGB(128, 0, 0, 0),
                            onPressed: () {
                              if (_selectedDate != null &&
                                  _selectedDate1 != null) {
                                setState(() {
                                  BlocProvider.of<CommandeCubitConditional>(
                                    context,
                                  ).fetchCommandesfilter(
                                    DateFormat(
                                      'yyyy-MM-dd',
                                    ).format(_selectedDate!),
                                    DateFormat(
                                      'yyyy-MM-dd',
                                    ).format(_selectedDate1!),
                                  );
                                  select = !select;
                                });
                                setState(() {});
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Veuillez sélectionner les dates.',
                                      style: TextStyle(
                                        fontSize: widthScreen * 0.01,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              BlocProvider.of<DetailsCommadesCubit>(
                                context,
                              ).fetchDetailsCommades();
                            },
                            icon: Icon(
                              Icons.search,
                              size: widthScreen * 0.02,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: widthScreen * 0.005),

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
                          "Date",
                          "client",
                          "TotalHT",
                          "TVA%",
                          "TOTAL TTC",
                        ],
                        colorselected: false,
                        val: widthScreen * 0.7,
                      ),

                      SizedBox(
                        height: hScreen * 0.60,
                        width: widthScreen * 0.7,
                        child: ListView.builder(
                          itemCount:
                              select == false
                                  ? (commandes?.length ?? 0)
                                  : (commandesfilters?.length ?? 0),

                          itemBuilder: (context, index) {
                            final list =
                                select == false ? commandes : commandesfilters;
                            if (list == null || list.isEmpty) {
                              return const SizedBox(); // ou un widget vide
                            }

                            final commande = list[index];
                            BlocProvider.of<ClientidCubitConditional>(
                              context,
                            ).fetchClientidfilter(commande.id_client ?? '');
                            List<Client>? clientidfilters2 =
                                BlocProvider.of<ClientidCubitConditional>(
                                  context,
                                ).clientsidfltter;
                            print(clientProvider.clientValue.name_client);
                            List commandeList = [
                              commande.id_commande ?? '',
                              commande.date_commande ?? '',
                              clientidfilters2![0].name_client ?? '',
                              (commande.total_Ht ?? 0).toString(),
                              (commande.tVA ?? 0).toString(),
                              (commande.total_TTC ?? 0).toString(),
                            ];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  select = !select!;
                                  commandemodifier = commande;
                                });
                              },
                              child: Lignelistev(
                                color: false,
                                listtitle: commandeList,
                                colorselected:
                                    commandemodifier == commande ? true : false,
                                val: widthScreen * 0.7,
                              ),
                            );
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (commandemodifier != null) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Formulestandaire(
                                  widthScreen: widthScreen,

                                  classtype: Impremercommande(
                                    commande: commandemodifier,
                                  ),
                                );
                              },
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Veuillez sélectionner un Produit.",
                                ),
                              ),
                            );
                          }
                        },
                        child: ContainerBot(
                          image: "asset/icons8-print-100.png",
                          text: "Impremer Commande",
                          width: widthScreen * 0.2,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
