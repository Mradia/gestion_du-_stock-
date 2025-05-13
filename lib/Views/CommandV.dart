import 'package:flutter/material.dart';

class Commandv extends StatefulWidget {
  const Commandv({super.key});

  @override
  State<Commandv> createState() => _CommandvState();
}

class _CommandvState extends State<Commandv> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 50, width: 50, child: Text("data"));
  }
}