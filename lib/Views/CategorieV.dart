import 'package:flutter/material.dart';

class Categoriev extends StatefulWidget {
  const Categoriev({super.key});

  @override
  State<Categoriev> createState() => _CategorievState();
}

class _CategorievState extends State<Categoriev> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 50, width: 50, child: Text("data"));
  }
}
