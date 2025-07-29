import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/containerblacktext.dart';

class Lignelistev extends StatefulWidget {
  final bool color;
  final List listtitle;
  final bool? colorselected;
  final double val;

  const Lignelistev({
    super.key,
    required this.color,
    required this.listtitle,
    this.colorselected, required this.val,
  });

  @override
  State<Lignelistev> createState() => _LignelistevState();
}

class _LignelistevState extends State<Lignelistev> {
  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: widget.val * 0.03,
      width:  widget.val,

      child: Padding(
        padding: EdgeInsets.only(left: widget.val * 0.07),

        child: ListView.builder(
          itemCount: widget.listtitle.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Containerblacktext(
                  text: widget.listtitle[index].toString(),
                  color: widget.color,
                  colorselected: widget.colorselected,
                  val: widget.val,
                ),
                Positioned(
                  child: Container(
                    height:  widget.val* 0.03,
                    width:  widget.val* 0.085,
                    decoration: BoxDecoration(
                      color:
                          widget.colorselected == true
                              ? const Color.fromARGB(164, 76, 175, 79)
                              : Colors.transparent,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
