import 'package:flutter/material.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_Categorie/categorie_cubit/categories_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_Categorie/cubit_categorie_conditionnal/categorie_cubit_conditional.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_Categorie/getidcategorie/get_id_categorie_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_Commande/Commandes_cubit/commandes_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_Commande/cubit_Commande_conditionnal/commande_cubit_conditional.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_client/clients_cubit/clients_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_client/cubit_client_conditionnal/client_cubit_conditional.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_client/cubit_getClientbyid_conditionnal/clientbyid_cubit_conditional.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_details_commandes/add_DetailsCommades_cubit/add_detailsCommades_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_details_commandes/cubit_DetailsCommades_conditionnal/detailsCommades_cubit_conditional.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_details_commandes/detailsCommades_cubit/detailsCommades_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_product/add_Product_cubit/add_product_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_product/cubit_product_conditionnal/product_cubit_conditional.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_product/products_cubit/products_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_utilisateur/add_Utilisateur_cubit/add_Utilisateur_cubit.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_utilisateur/cubit_Utilisateur_conditionnal/utilisateur_cubit_conditional.dart';
import 'package:flutter_application_gestion_stock/Cubits/cubit_utilisateur/utilisateurs_cubit/utilisateurs_cubit.dart';
import 'package:flutter_application_gestion_stock/Models/Produit.dart';
import 'package:flutter_application_gestion_stock/Models/categorie.dart';
import 'package:flutter_application_gestion_stock/Models/client.dart';
import 'package:flutter_application_gestion_stock/Models/commande.dart';
import 'package:flutter_application_gestion_stock/Models/details_commades.dart';
import 'package:flutter_application_gestion_stock/Models/utilisateur.dart';
import 'package:flutter_application_gestion_stock/Views/widgets/identifierlenter.dart';
import 'package:flutter_application_gestion_stock/constant/constant.dart';
import 'package:flutter_application_gestion_stock/provider/clientprovider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'provider/valeur.dart';
import 'package:uuid/uuid.dart';

var uuidclient = Uuid();
var uidProduit = Uuid();
var uidCategorie = Uuid();
var uidDetailsCommades = Uuid();
var uidCommade = Uuid();
var uidUtilisateur = Uuid();
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ClientAdapter());
  await Hive.openBox<Client>(kClientBox);
  Hive.registerAdapter(ProduitAdapter());
  await Hive.openBox<Produit>(kProduitBox);
  Hive.registerAdapter(CategorieAdapter());
  await Hive.openBox<Categorie>(kCategorieBox);
  Hive.registerAdapter(CommandeAdapter());
  await Hive.openBox<Commande>(kCommandeBox);
  Hive.registerAdapter(UtilisateurAdapter());
  await Hive.openBox<Utilisateur>(kUtilisateurBox);

  Hive.registerAdapter(DetailsCommadesAdapter());
  await Hive.openBox<DetailsCommades>(kDetailsCommadesBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DropdownValueProvider()),
        ChangeNotifierProvider(create: (_) => ClientValueProvider()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ClientsCubit>(create: (context) => ClientsCubit()),
          BlocProvider<ClientCubitConditional>(
            create: (context) => ClientCubitConditional(),
          ),
          BlocProvider<ProductsCubit>(create: (context) => ProductsCubit()),
          BlocProvider<ProductCubitConditional>(
            create: (context) => ProductCubitConditional(),
          ),
          BlocProvider<CategoriesCubit>(create: (_) => CategoriesCubit()),
          BlocProvider<CategorieCubitConditional>(
            create: (_) => CategorieCubitConditional(),
          ),
          BlocProvider<CommandesCubit>(create: (_) => CommandesCubit()),
          BlocProvider<CommandeCubitConditional>(
            create: (_) => CommandeCubitConditional(),
          ),
          BlocProvider<AddProductCubit>(create: (context) => AddProductCubit()),
          BlocProvider<GetIdCategorieCubit>(
            create: (context) => GetIdCategorieCubit(),
          ),
          BlocProvider<CategorieCubitConditional>(
            create: (context) => CategorieCubitConditional(),
          ),
          BlocProvider<DetailsCommadesCubit>(
            create: (context) => DetailsCommadesCubit(),
          ),
          BlocProvider<AddDetailsCommadesCubit>(
            create: (context) => AddDetailsCommadesCubit(),
          ),
          BlocProvider<DetailsCommadesCubitConditional>(
            create: (context) => DetailsCommadesCubitConditional(),
          ),
          BlocProvider<AddUtilisateurCubit>(
            create: (context) => AddUtilisateurCubit(),
          ),
          BlocProvider<UtilisateurCubitConditional>(
            create: (context) => UtilisateurCubitConditional(),
          ),
          BlocProvider<UtilisateursCubit>(
            create: (context) => UtilisateursCubit(),
          ),
          BlocProvider<ClientidCubitConditional>(
            create: (context) => ClientidCubitConditional(),
          ),

          // ...autres blocs...
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(useMaterial3: true),
          home: Identifierlenter(),
        ),
      ),
    );
  }
}
