import 'package:comidas/providers/movies_provider.dart';
import 'package:comidas/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => MoviesProvider(), lazy: false,)
    ], 
    child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comidas',
      initialRoute: "_home",
      routes: {
        '_home': (_) => const HomeScreen(),
        '_details': (_) => const DetailsScreen()
      },
      theme: ThemeData.light().copyWith(appBarTheme: const AppBarTheme(elevation: 0, color: Colors.amber, centerTitle: true)));
  }
}
