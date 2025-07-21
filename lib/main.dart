
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:initial_task/learning_bloc/counter_bloc.dart';
import 'package:initial_task/learning_bloc/counter_screen.dart';
import 'package:initial_task/screens/home_screen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
          displayMedium: TextStyle(fontSize:30,color: Colors.black )
        ),

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: const HomeScreen(),
      //  home: BlocProvider(
      //   create: (_) => CounterBloc(),
      //   child: CounterScreen(),
      // ),
    );
  }
}
