import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';
import 'package:shopping_app/home_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> CartProvider() ,
      child: MaterialApp(
        title : 'Shopping App',
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          fontFamily: 'Lato',
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 253, 227, 0),
            brightness: Brightness.light),
          primaryColor: const Color.fromARGB(255, 255, 230, 0),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        prefixIconColor: Color.fromARGB(116, 35, 35, 31),),
        textTheme: TextTheme(
          titleLarge:  TextStyle(fontWeight: FontWeight.bold,fontSize: 35,),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16
          )
        )),
        home :  const HomePage()),
    );
  }
}