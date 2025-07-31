import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:initial_task/bloc/dots_indicator/dots_indicator_bloc.dart';
import 'package:initial_task/bloc/favourite_hotels/favourite_hotels_bloc.dart';
import 'package:initial_task/bloc/favourite_things_to_do/favourite_things_to_do_bloc.dart';
import 'package:initial_task/bloc/forum/forum_bloc.dart';
import 'package:initial_task/bloc/forum_like/forum_like_bloc.dart';
import 'package:initial_task/bloc/hotels/hotels_bloc.dart';
import 'package:initial_task/bloc/restaurant/restaurant_bloc.dart';
import 'package:initial_task/bloc/tabbar/tabbar_bloc.dart';
import 'package:initial_task/bloc/things_to_do/things_to_do_bloc.dart';
import 'package:initial_task/clipper/clipper_design1.dart';
import 'package:initial_task/clipper/clipper_design2.dart';
import 'package:initial_task/clipper/clipper_design3.dart';
import 'package:initial_task/clipper/clipper_learn.dart';
import 'package:initial_task/custom_painter/custom_design_forum.dart';
import 'package:initial_task/custom_painter/custom_painter_design.dart';
import 'package:initial_task/custom_painter/custom_painter_design1.dart';
import 'package:initial_task/custom_painter/shape_maker_design.dart';

import 'package:initial_task/screens/home_screen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TabbarBloc()),
        BlocProvider(create: (_) => DotsIndicatorBloc()),
        BlocProvider(create: (_) => HotelsBloc()),
        BlocProvider(create: (_) => ThingsToDoBloc()),
        BlocProvider(create: (_) => FavouriteHotelsBloc()),
        BlocProvider(create: (_) => FavouriteThingsToDoBloc()),
        BlocProvider(create: (_) => RestaurantBloc()),
        BlocProvider(create: (_) => ForumBloc()),
        BlocProvider(create: (_) => ForumLikeBloc()),
      ],
      child: MaterialApp(
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
            // displayMedium: TextStyle(fontSize: 30, color: Colors.black),
          ),

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        ),
        // home: const HomeScreen(),
        // home: BlocProvider(create: (_) => CounterBloc(), child: CounterScreen()),
        // home: BlocProvider(create: (_) => NameBloc(), child: NameScreen()),
        // home: BlocProvider(
        //   create: (_) => CounterAppBloc(),
        //   child: CounterScreen(),
        // ),
        home: 
        // ClipperLearn()
        // CustomDesignForum(),
        // CustomPainterDesign1(),
        // CustomPainterDesign(),
        // CustomePainterLearn()
        HomeScreen(index: 0),
        // ShapeMakerDesign(),
        // ClipperDesign1()
        // ClipperDesign2()
        // ClipperDesign3()
        
      ),
    );
  }
}
