import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/formulestandaire.dart';
import 'package:flutter_application_gestion_stock/Views/widgetsutilisateur/confirmeradmis.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_gestion_stock/Views/HomeV.dart';

import 'package:flutter_application_gestion_stock/Views/widgets/costumeelevateubutton.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/decorationtextfield.dart';
import 'package:flutter_application_gestion_stock/provider/valeur.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
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
  Widget build(BuildContext context) {
    final dropdownProvider = Provider.of<DropdownValueProvider>(context);
    final double widthScreen = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(width: widthScreen * 0.05),
        Container(
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
                Costumeelevateubutton(
                  onPressed: () {},
                  isLoading: isLoading,
                  text: "Enregistrer",
                  widthScreen: widthScreen,
                  child: HomeV(
                    istapclient: false,
                    istapcategorie: false,
                    istapproduit: false,
                    istapcommqnde: false,
                    istaputilisateur: true,
                  ),
                ),

                SizedBox(height: widthScreen * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Do not have an account?",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextButton(
                      onPressed: () {
                       
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return  Formulestandaire(
                                              widthScreen: widthScreen / 0.7,
                                              text: "Confirmation Admission",
                                              classtype: Confirmeradmis()
                                            );}
                        );
                                  
   
                      },
                      child: const Text(
                        'sign up',
                        style: TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                //Text("Do not have an account?
              ],
            ),
          ),
        ),
      ],
    );
  }
}
