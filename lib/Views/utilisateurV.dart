import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_gestion_stock/Views/widgetsutilisateur/signIn.dart';
import 'package:flutter_application_gestion_stock/Views/widgetsutilisateur/signup.dart';
import 'package:flutter_application_gestion_stock/provider/valeur.dart';

class AuthV extends StatefulWidget {
  const AuthV({super.key});

  @override
  State<AuthV> createState() => _AuthVState();
}

class _AuthVState extends State<AuthV> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController namUserController = TextEditingController();
  bool isVisable = true;
  bool isLoading = false;

  void onPasswordChanged(String password) {
    // Add your logic here, e.g., print or validate the password
    print("Password changed: $password");
  }

  @override
  void dispose() {
    passwordController.dispose();
    namUserController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final dropdownProvider = Provider.of<DropdownValueProvider>(context);
    return dropdownProvider.signedIn ? Signup() : Signin();
    // return Signup();
  }
}
