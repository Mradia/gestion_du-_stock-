import 'package:flutter/material.dart';

class Costumeelevateubutton extends StatefulWidget {
  final bool isLoading;
  final String text;
  final Widget child;
  final double widthScreen;

  const Costumeelevateubutton({
    super.key,
    required this.isLoading,
    required this.text,
    required this.child,
    required this.widthScreen,
    required Null Function() onPressed,
  });

  @override
  State<Costumeelevateubutton> createState() => _CostumeelevateubuttonState();
}

class _CostumeelevateubuttonState extends State<Costumeelevateubutton> {
  @override
  Widget build(BuildContext context) {
    
    return ElevatedButton(
      onPressed: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => widget.child),
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.red),
        padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      child:
          widget.isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : Text(
                widget.text,
                style: TextStyle(
                  fontSize: widget.widthScreen * 0.01,
                  color: Colors.white,
                ),
              ),
    );
  }
}
