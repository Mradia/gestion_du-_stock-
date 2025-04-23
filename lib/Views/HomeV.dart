import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/constant/decorationtextfield.dart';
import 'package:flutter_application_gestion_stock/constant/snackbar.dart';

class HomeV extends StatefulWidget {
  const HomeV({super.key});

  @override
  State<HomeV> createState() => _HomeVState();
}

class _HomeVState extends State<HomeV> {
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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 249, 248),
      body: Row(
        children: [
          Container(
            width: widthScreen * 0.1,
            height: double.infinity,
            color: Colors.black,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: widthScreen * 0.01,
                      vertical: widthScreen * 0.03,
                    ),
                    child: Image.asset(
                      "asset/icons8-person-94.png",
                      height: widthScreen * 0.05,
                      width: widthScreen * 0.1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: widthScreen * 0.01,
                      vertical: widthScreen * 0.03,
                    ),
                    child: Image.asset(
                      "asset/icons8-cart-48.png",
                      height: widthScreen * 0.05,
                      width: widthScreen * 0.3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: widthScreen * 0.01,
                      vertical: widthScreen * 0.03,
                    ),
                    child: Image.asset(
                      "asset/icons8-categorize-48.png",
                      height: widthScreen * 0.05,
                      width: widthScreen * 0.3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: widthScreen * 0.01,
                      vertical: widthScreen * 0.03,
                    ),
                    child: Image.asset(
                      "asset/icons8-shopping-basket-100.png",
                      height: widthScreen * 0.05,
                      width: widthScreen * 0.3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: widthScreen * 0.01,
                      vertical: widthScreen * 0.03,
                    ),
                    child: Image.asset(
                      "asset/icons8-account-64.png",
                      height: widthScreen * 0.05,
                      width: widthScreen * 0.3,
                    ),
                  ),
                ],
              ),
            ),
          ),
SizedBox(width: widthScreen*0.3,),
   Container(
    margin: EdgeInsets.only(
      top: widthScreen * 0.15,
     
    ),
    width: widthScreen * 0.4,
    height: double.infinity,
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
           ElevatedButton(
                    onPressed: () async {
                  
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeV()),
                        );
                  
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(12)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            "Register",
                            style: TextStyle(fontSize: 19),
                          ),
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  //Text("Do not have an account?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Do not have an account?",
                          style: TextStyle(fontSize: 18)),
                      TextButton(
                          onPressed: () {
                            /*  Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()),
                            );*/
                          },
                          child: const Text('sign in',
                              style: TextStyle(
                                  fontSize: 18,
                                  decoration: TextDecoration.underline))),
                    ],
                  )
       ],
     ),
   )
        ],
      ),
    );
  }
}
