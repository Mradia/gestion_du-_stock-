import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_gestion_stock/Models/details_commades.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/decorationtextfield.dart';
import 'package:flutter_application_gestion_stock/provider/clientprovider.dart';
import 'package:provider/provider.dart';

class Rowtvattc extends StatefulWidget {

 final  double? tVA;

  
  final bool isLoading;

 // Variable pour stocker la TVA 
 final List<DetailsCommades>? detailsCommadesfilters;


  const Rowtvattc({super.key,required this.tVA, required this.isLoading,required this.detailsCommadesfilters});

  @override
  State<Rowtvattc> createState() => _RowtvattcState();
}


class _RowtvattcState extends State<Rowtvattc> {
 // ignore: non_constant_identifier_names
 double tOTAL_HT = 0.0;

double tOTAL_TTC =0.0 ;
@override
  void initState() {

 setState(() {
                                             tOTAL_HT= 0;
                                              });

                                              // Vérifie que la liste n'est pas nulle
                                              if (widget.detailsCommadesfilters !=
                                                  null) {
                                                for (var details
                                                    in widget.detailsCommadesfilters!) {
                                                  tOTAL_HT +=
                                                      details.total ?? 0;
                                                }
                                              }

                                           
                                              setState(() {
                                                tOTAL_TTC =
                                                    tOTAL_HT *
                                                    (1 + (widget.tVA! / 100));
                                              });

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
       final clientProvider = Provider.of<ClientValueProvider>(context);
     return Row(
    children: [
        Padding(
                padding: EdgeInsets.all(widthScreen * 0.007),
                child: Text(
                  "TOTAL HT :",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widthScreen * 0.007,
                  ),
                ),
              ),
           
                            SizedBox(
                        height: widthScreen * 0.04,
                        width: widthScreen * 0.1,

                        child: Padding(
                          padding: EdgeInsets.all(widthScreen * 0.007),
                          child: TextFormField(
                            keyboardType: TextInputType.text,

                            decoration: decorationTextfield.copyWith(
                              hintText: tOTAL_HT.toString(),
                              hintStyle: TextStyle(
                                color: Colors.black,fontWeight: FontWeight.w900,
                                fontSize: widthScreen * 0.007,
                              ),
                          
                            ),
                            onChanged: (value) {
                         /*     BlocProvider.of<ProductCubitConditional>(
                                context,
                              ).fetchProduitsfilter(value);*/
                            },
                          ),
                        ),
                      ),
                      Padding(
                padding: EdgeInsets.all(widthScreen * 0.007),
                child: Text(
                  "TVA :",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widthScreen * 0.007,
                  ),
                ),
              ),
            
                                   SizedBox(
                        height: widthScreen * 0.04,
                        width: widthScreen * 0.1,

                        child: Padding(
                          padding: EdgeInsets.all(widthScreen * 0.007),
                          child: TextFormField(
                       
                            keyboardType: TextInputType.text,

                            decoration: decorationTextfield.copyWith(
                              hintText: clientProvider.tVa.toString(),
                              hintStyle: TextStyle(
                                color: Colors.black,fontWeight: FontWeight.w900,
                                fontSize: widthScreen * 0.007,
                              ),
                          
                            ),
                            onChanged: (value) {
                  clientProvider.tVa=value.isNotEmpty ? double.tryParse(value) ?? 0.0 : 0.0;
                            },
                          ),
                        ),
                      ),
                       Padding(
                padding: EdgeInsets.all(widthScreen * 0.007),
                child: Text(
                  "TOTAL TTC :",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widthScreen * 0.007,
                  ),
                ),
              ),
                                  SizedBox(
                        height: widthScreen * 0.04,
                        width: widthScreen * 0.1,

                        child: Padding(
                          padding: EdgeInsets.all(widthScreen * 0.007),
                          child: TextFormField(
                         
                            keyboardType: TextInputType.text,

                            decoration: decorationTextfield.copyWith(
                              hintText: tOTAL_TTC.toString(),
                              hintStyle: TextStyle(
                                color: Colors.black,fontWeight: FontWeight.w900,
                                fontSize: widthScreen * 0.007,
                              ),
                          
                            ),
                            onChanged: (value) {
                         /*     BlocProvider.of<ProductCubitConditional>(
                                context,
                              ).fetchProduitsfilter(value);*/
                            },
                          ),
                        ),
                      ),

    ],
  );
  }
}



