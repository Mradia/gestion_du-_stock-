import 'package:flutter/material.dart';

class Containerblacktext extends StatefulWidget {
  final String? text;
  final bool? color;
  final bool? colorselected;
  final double? val;
  const Containerblacktext({
    super.key,
    this.text,
    this.color,
    this.colorselected,
    this.val,
  });

  @override
  State<Containerblacktext> createState() => _ContainerblacktextState();
}

class _ContainerblacktextState extends State<Containerblacktext> {
  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    return Container(
      height: w * 0.030,
      width: widget.val! * 0.085,
    
      decoration: BoxDecoration(
        color:
            (widget.color ?? false)
                ? Colors.black
                : const Color.fromARGB(255, 201, 201, 201),
        border: Border.all(color: Colors.white),
      ),
      child: Padding(
        padding: EdgeInsets.all(widget.val! * 0.003),
        child: Text(
          widget.text ?? '',
          style: TextStyle(
            color: (widget.color ?? false) ? Colors.white : Colors.black,
            fontSize: widget.val! * 0.015,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
