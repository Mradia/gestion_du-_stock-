import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Views/HomeV.dart';

class Costumeelevateubutton extends StatefulWidget {
  final bool isLoading ;
  final String  text;
  final Widget child;

  const Costumeelevateubutton({super.key, required this.isLoading,required this.text,required this.child});

  @override
  State<Costumeelevateubutton> createState() => _CostumeelevateubuttonState();
}

class _CostumeelevateubuttonState extends State<Costumeelevateubutton> {
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
                    onPressed: () async {
                  
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => widget.child),
                        );
                  
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(12)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                    ),
                    child: widget.isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            widget.text,
                            style: const TextStyle(fontSize: 19),
                          ),
                  );
  }
}