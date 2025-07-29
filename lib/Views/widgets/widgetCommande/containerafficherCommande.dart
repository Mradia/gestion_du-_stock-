import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_details_commandes/cubit_DetailsCommades_conditionnal/detailsCommades_cubit_conditional.dart';
import 'package:flutter_application_gestion_stock/Models/details_commades.dart';





import 'package:flutter_application_gestion_stock/Views/widgets/lignelisteV.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Containeraffichercommande extends StatefulWidget {
  // final List<DetailsCommades>? listDetailsCommades;
  // final List<Client>? listDetailsCommades;
  final List<DetailsCommades>? detailsCommadesfilters;
  final String id_commande;
  final List <List<String>>? listDetailsCommades;
  final bool isLoading;
  const Containeraffichercommande({super.key, required this.isLoading,required this.listDetailsCommades,required this.detailsCommadesfilters, required this.id_commande});

  @override
  State<Containeraffichercommande> createState() => _ContaineraffichercommandeState();
}

class _ContaineraffichercommandeState extends State<Containeraffichercommande> {
  @override
  void initState() {
    // TODO: implement initState
     BlocProvider.of<DetailsCommadesCubitConditional>(context).fetchDetailsCommadesfilter(widget.id_commande);
   BlocProvider.of<DetailsCommadesCubitConditional>(context).detailsCommadesfltter;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   
   final double widthScreen = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;
  
        return 
       BlocBuilder<DetailsCommadesCubitConditional, DetailsCommadesCubitConditionalState>(
          builder: (context, state) {
            List<DetailsCommades>? detailsCommadesfilters =
                BlocProvider.of<DetailsCommadesCubitConditional>(context).detailsCommadesfltter;
            return   

   SingleChildScrollView(
     child: Container(
      alignment: Alignment.topLeft,
     
      height: heightScreen * 0.4,
      width: widthScreen * 0.43,
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
                      "Commande",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: widthScreen * 0.015,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: heightScreen * 0.01),
                
                    Container(
                      margin: EdgeInsets.only(
                        left: widthScreen * 0.02,
                        right: widthScreen * 0.025,
                      ),
                      color: Colors.white,
                      height: widthScreen * 0.002,
                      width: widthScreen * 0.3,
                    ),
                    SizedBox(height: heightScreen * 0.01),
                    Lignelistev(
                      color: true,
                      listtitle: ["id Produit ", "NomProduit", "Quantité", "Prix", "Remise","Totel"],
                      colorselected: false,
                      val: widthScreen * 0.7,
                    ),
                   SizedBox(
                    height: heightScreen * 0.60,
                    width: widthScreen * 0.80,
                    child: ListView.builder(
                      itemCount:
                         widget.detailsCommadesfilters?.length ?? 0,
                      itemBuilder: (context, index) {
                        final detailsCommades=
                           widget.detailsCommadesfilters![index];
                        List detailsCommadesList = [
                          detailsCommades.id_produit ?? "N/A",
                          detailsCommades.nom_produit ?? "N/A",
                          detailsCommades.quantity.toString(),
                          detailsCommades.prix.toString(),
                          detailsCommades.remise.toString(),
                          detailsCommades.total.toString()
                        ];
                        return Lignelistev(
                          color: false,
                          listtitle: detailsCommadesList,
                          colorselected:
                          false,
                          val: widthScreen * 0.7,
                        );
                      },
                    ) 
                         
                               
                  ),
                  ],
                ),
              ),
       ),
   ) 
            ;
          },
    );  

  
  }
}