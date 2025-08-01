import 'package:flutter/material.dart';

class ContainerBot extends StatefulWidget {
  final String? text;
  final String? image;
  final double? width;

  const ContainerBot({super.key, this.text, this.image, this.width});

  @override
  State<ContainerBot> createState() => _ContainerBotState();
}

class _ContainerBotState extends State<ContainerBot> {
  @override
  Widget build(BuildContext context) {
      final double widthScreen = MediaQuery.of(context).size.width;
    return        Container(
              height:widthScreen * 0.03,
      width: widget.width ?? widthScreen * 0.14,
              
              color: Colors.black,
              child:  Row(
                children: [
                  Image.asset(widget.image ?? 'assets/default_image.png', height: widthScreen * 0.02, width: widthScreen * 0.05,),
                  
                  SizedBox(
                    width: widthScreen * 0.01,
                  ),
                  Text(widget.text ?? '', style: TextStyle(fontSize: widthScreen * 0.01, color: Colors.white, fontWeight: FontWeight.w900),),
                ],
              ),
            );
  }
}