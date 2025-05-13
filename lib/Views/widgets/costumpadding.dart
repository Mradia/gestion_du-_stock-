import 'package:flutter/material.dart';

class Costumpadding extends StatefulWidget {
 final String iconPath ;
 final bool istap ;
 final String text ;
  const Costumpadding({super.key, required this.iconPath, required this.istap, required this.text});

  @override
  State<Costumpadding> createState() => _CostumpaddingState();
}

class _CostumpaddingState extends State<Costumpadding> {
  @override
  Widget build(BuildContext context) {





    final double widthScreen = MediaQuery.of(context).size.width;
    return 
   Container(
    color: widget.istap ? const Color.fromARGB(54, 247, 21, 5) : Colors.black,
     child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: widthScreen * 0.01,
                        vertical: widthScreen * 0.03,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            widget.iconPath,
                            height: widthScreen * 0.05,
                            width: widthScreen * 0.1,
                          ),
                          Text(widget.text,style: TextStyle(

                            fontSize: widthScreen * 0.01,
                            color:  Colors.white,
                            fontWeight: FontWeight.bold,
                          ),)
                        ],
                      ),
                    ),
   );
  }
}