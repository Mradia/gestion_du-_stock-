import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Views/HomeV.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/costumeelevateubutton.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/decorationtextfield.dart';

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
    return    Row(
      children: [   SizedBox(width: widthScreen * 0.05),
        Container(
        margin: EdgeInsets.only(
          top: widthScreen * 0.15,
         
        ),
        width: widthScreen * 0.4,
        height: double.infinity,
         child: SingleChildScrollView(
           child: Column(
             children: [
                 Padding(
                   padding:  EdgeInsets.all(widthScreen * 0.01),  
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
                 padding:  EdgeInsets.all(widthScreen * 0.01),
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
                      Costumeelevateubutton(
                        isLoading: isLoading,
                        text: "Enregistrer",
                        child: HomeV(),
                      ),     
                        const SizedBox(
                          height: 33,
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