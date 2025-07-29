import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_application_gestion_stock/Cubits/cubit_utilisateur/utilisateurs_cubit/utilisateurs_cubit.dart';
import 'package:flutter_application_gestion_stock/Models/utilisateur.dart';
import 'package:flutter_application_gestion_stock/Views/HomeV.dart';

import 'package:flutter_application_gestion_stock/Views/widgets/decorationtextfield.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/formulestandaire.dart';

import 'package:flutter_application_gestion_stock/Views/widgetsutilisateur/incrireadmin.dart';
import 'package:flutter_application_gestion_stock/provider/valeur.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Identifierlenter extends StatefulWidget {
  const Identifierlenter({super.key});

  @override
  State<Identifierlenter> createState() => _IdentifierlenterState();
}

class _IdentifierlenterState extends State<Identifierlenter> {
  final TextEditingController namUserController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    namUserController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool isVisable = true;
  bool isLoading = false;
  void onPasswordChanged(String password) {
    // Add your logic here, e.g., print or validate the password
    print("Password changed: $password");
  }

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<UtilisateursCubit>(context).fetchUtilisateurs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dropdownProvider = Provider.of<DropdownValueProvider>(context);
    final double widthScreen = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;
    return BlocBuilder<UtilisateursCubit, UtilisateursState>(
      builder: (context, state) {
        List<Utilisateur>? utilisateurs =
            BlocProvider.of<UtilisateursCubit>(context).utilisateurs;
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: heightScreen * 0.2),
                Padding(
                  padding: EdgeInsets.only(
                    left: widthScreen * 0.3,
                    right: widthScreen * 0.3,
                  ),

                  child: SizedBox(
                    width: widthScreen * 0.5,
                    child: Padding(
                      padding: EdgeInsets.all(widthScreen * 0.01),
                      child: TextFormField(
                        controller: namUserController,
                        keyboardType: TextInputType.text,

                        decoration: decorationTextfield.copyWith(
                          hintText: "Enter Your Name: ",
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.person),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: widthScreen * 0.3,
                    right: widthScreen * 0.3,
                  ),
                  child: SizedBox(
                    width: widthScreen * 0.5,
                    child: Padding(
                      padding: EdgeInsets.all(widthScreen * 0.01),
                      child: TextFormField(
                        onChanged: (password) {
                          onPasswordChanged(password);
                        },
                        // we return "null" when something is valid
                        validator: (value) {
                          return value!.length < 8
                              ? "Enter at least 8 characters"
                              : null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: isVisable ? true : false,
                        decoration: decorationTextfield.copyWith(
                          hintText: "Enter Your Password : ",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisable = !isVisable;
                              });
                            },
                            icon:
                                isVisable
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: widthScreen * 0.02),
                Padding(
                  padding: EdgeInsets.only(
                    left: widthScreen * 0.4,
                    right: widthScreen * 0.4,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                  shadowColor: Colors.red,
                    ),

                    onPressed: () {
                      if (utilisateurs!.isNotEmpty) {
                        for (Utilisateur utilisateur in utilisateurs) {
                          if (utilisateur.Nom_utilisateur ==
                                  namUserController.text &&
                              utilisateur.Mot_de_passe_utilisateur ==
                                  passwordController.text) {
                            setState(() {
                              isLoading = true;
                            });
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => const HomeV(
                                      istapclient: true,
                                      istapcategorie: false,
                                      istapproduit: false,
                                      istapcommqnde: false,
                                      istaputilisateur: false,
                                    ),
                              ),
                            );
                          }
                        }
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Formulestandaire(
                              widthScreen: widthScreen,
                              text: "Inscrire un admin",
                              classtype: Incrireadmin(),
                            );
                          },
                        );
                      }
                    },
                    child: Text("Enregistrer"),
                  ),
                ),

                //Text("Do not have an account?
              ],
            ),
          ),
        );
      },
    );
  }
}
