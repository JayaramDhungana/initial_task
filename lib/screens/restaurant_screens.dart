import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:initial_task/bloc/restaurant/restaurant_bloc.dart';
import 'package:initial_task/bloc/restaurant/restaurant_event.dart';
import 'package:initial_task/bloc/restaurant/restaurant_state.dart';
import 'package:initial_task/bloc/tabbar/tabbar_bloc.dart';
import 'package:initial_task/bloc/tabbar/tabbar_event.dart';
import 'package:initial_task/provider/restaurant_provider.dart';
import 'package:initial_task/widgets/screen_widgets.dart';

class RestaurantScreens extends ConsumerStatefulWidget {
  const RestaurantScreens({super.key});

  @override
  ConsumerState<RestaurantScreens> createState() => _RestaurantScreensState();
}

class _RestaurantScreensState extends ConsumerState<RestaurantScreens> {
  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RestaurantBloc>().add(LoadRestaurantData());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          context.read<TabbarBloc>().add(ChangeTabIndex(index: 0));
        },
        child: Column(
          children: [
            Flexible(
              child: BlocBuilder<RestaurantBloc, RestaurantState>(
                builder: (context, state) {
                  if (state is RestaurantInitialState) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      itemCount: state.restaurantData.length,
                      itemBuilder: (context, index) {
                        final restaurantDataToShow = state.restaurantData[index];
                        return screenWidget(
                          context: context,
                          imageUrl: restaurantDataToShow.imageUrl,
                          name: restaurantDataToShow.name,
                          description: restaurantDataToShow.description,
                          ratings: restaurantDataToShow.ratings,
                          raters: restaurantDataToShow.raters.toInt(),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
