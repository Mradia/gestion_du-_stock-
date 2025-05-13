import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/decorationtextfield.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/dropdown.dart';
import 'package:flutter_application_gestion_stock/Views/widgetsclintV/lignelisteV.dart';
import 'package:flutter_application_gestion_stock/Views/widgetsclintV/container.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/containerdivide.dart';
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
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: widthScreen * 0.05),
        Row(
          children: [
            SizedBox(width: widthScreen * 0.08),
            ContainerBot(image: "asset/icons8-add-64.png", text: "Ajouter"),
            SizedBox(width: widthScreen * 0.04),
            ContainerBot(
              image: "asset/icons8-recycle-64.png",
              text: "Modifier",
            ),
            SizedBox(width: widthScreen * 0.04),
            ContainerBot(image: "asset/icons8-close-94.png", text: "Suprimer"),
            SizedBox(width: widthScreen * 0.03),
          ],
        ),
   SizedBox(height: widthScreen * 0.005),
        Container(
          margin: EdgeInsets.only(left: widthScreen * 0.06, right: widthScreen * 0.035),
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

          child:          Padding(
                   padding:  EdgeInsets.all(widthScreen * 0.01),  
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
                    ),
                 ),

        )
          ],
        ),
        SizedBox(height: widthScreen * 0.005),
           Container(
          margin: EdgeInsets.only(left: widthScreen * 0.06, right: widthScreen * 0.035),
          color: Colors.black,
          height: widthScreen * 0.002,
          width: widthScreen * 0.66,
         
        ),
        SizedBox(height: widthScreen * 0.005),
        Lignelistev()
      ],
    );
  }
}
