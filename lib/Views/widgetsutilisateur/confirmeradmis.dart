import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_utilisateur/cubit_Utilisateur_conditionnal/utilisateur_cubit_conditional.dart';
import 'package:flutter_application_gestion_stock/Models/utilisateur.dart';

import 'package:flutter_application_gestion_stock/Views/HomeV.dart';

import 'package:flutter_application_gestion_stock/Views/widgets/decorationtextfield.dart';
import 'package:flutter_application_gestion_stock/provider/valeur.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Confirmeradmis extends StatefulWidget {
  const Confirmeradmis({super.key});

  @override
  State<Confirmeradmis> createState() => _ConfirmeradmisState();
}

class _ConfirmeradmisState extends State<Confirmeradmis> {
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

  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<UtilisateurCubitConditional>(
      context,
    ).fetchUtilisateursfilter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dropdownProvider = Provider.of<DropdownValueProvider>(context);
    final double widthScreen = MediaQuery.of(context).size.width;
    return BlocBuilder<
      UtilisateurCubitConditional,
      UtilisateurCubitConditionalState
    >(
      builder: (context, state) {
        List<Utilisateur>? utilisateursfilters =
            BlocProvider.of<UtilisateurCubitConditional>(
              context,
            ).utilisateursfltter;
        return Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Container(
            margin: EdgeInsets.only(top: widthScreen * 0.15),
            width: widthScreen * 0.4,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
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
                  Padding(
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
                  SizedBox(height: widthScreen * 0.02),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        setState(() {
                          isLoading = true;
                          dropdownProvider.signedIn =
                              false; // Update the signedIn state
                        });

                        if (utilisateursfilters != null) {
                          for (Utilisateur utilisateur
                              in utilisateursfilters!) {
                            if (utilisateur.Nom_utilisateur ==
                                    namUserController.text &&
                                utilisateur.Mot_de_passe_utilisateur ==
                                    passwordController.text) {
                              setState(() {
                                dropdownProvider.signedIn =
                                    true; // Update the signedIn state
                              });
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => const HomeV(
                                        istapclient: false,
                                        istapcategorie: false,
                                        istapproduit: false,
                                        istapcommqnde: false,
                                        istaputilisateur: true,
                                      ),
                                ),
                              );
                            }
                          }
                        }
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                      namUserController.clear();
                      passwordController.clear();
                    },
                    child: Text("Enregistrer"),
                  ),

                  //Text("Do not have an account?
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
