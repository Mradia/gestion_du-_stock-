import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_utilisateur/add_Utilisateur_cubit/add_Utilisateur_cubit.dart';
import 'package:flutter_application_gestion_stock/Models/utilisateur.dart';
import 'package:flutter_application_gestion_stock/Views/HomeV.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/decorationtextfield.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/identifierlenter.dart';
import 'package:flutter_application_gestion_stock/main.dart';
import 'package:flutter_application_gestion_stock/provider/valeur.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
class Incrireadmin extends StatefulWidget {
  const Incrireadmin({super.key});

  @override
  State<Incrireadmin> createState() => _IncrireadminState();
}

class _IncrireadminState extends State<Incrireadmin> {
   final TextEditingController namUserController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisable = true;
  bool isLoading = false;
  void onPasswordChanged(String password) {
    // Add your logic here, e.g., print or validate the password
    print("Password changed: $password");
  }

  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  dispose() {
    namUserController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   final dropdownProvider = Provider.of<DropdownValueProvider>(context);
    final double widthScreen = MediaQuery.of(context).size.width;
    return BlocBuilder<AddUtilisateurCubit, AddUtilisateurState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Container(
            margin: EdgeInsets.only(top: widthScreen * 0.15),
            width: widthScreen * 0.4,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                      controller: passwordController,
                      obscureText: isVisable,
                      onChanged: onPasswordChanged,
                      decoration: decorationTextfield.copyWith(
                        hintText: "Enter Your Password: ",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisable = !isVisable;
                            });
                          },
                          icon: Icon(
                            isVisable ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: widthScreen * 0.02),
                  ElevatedButton(
                    onPressed: () {
                      print("password: ${passwordController.text}");
                      print("name: ${namUserController.text}");
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                          dropdownProvider.signedIn =
                              false; // Update the signedIn state
                        });

                        formKey.currentState!.save();
                        Utilisateur newUtilisateur = Utilisateur(
                          id_utilisateur: uidUtilisateur.v1(),
                          Nom_utilisateur: namUserController.text,
                          Mot_de_passe_utilisateur: passwordController.text,
                          Type_utilisateur:
                              "Admin",
                        );
                        // Add the new client to the Hive box
                        //    clientBox.add(newClient);
                        // Clear the text fields

                        // Optionally, you can show a success message or navigate to another screen
                        print("Utilisateur ajouté: ${newUtilisateur.toJson()}");
                        BlocProvider.of<AddUtilisateurCubit>(
                          context,
                        ).addUtilisateur(newUtilisateur);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Utilisateur ajouté avec succès'),
                          ),
                        );
                        namUserController.clear();
                        passwordController.clear();
                   

                        print(
                          "Utilisateur ajoutéeeeeeeeeeeee: ${newUtilisateur.toJson()}",
                        );
                             Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => const Identifierlenter(),
                          ),
                        );
                      
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },

                    child: Text("Enregister"),
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