import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(restaurantProvider).loadRestaurantsData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final restaurantDataFromProvider = ref
        .watch(restaurantProvider)
        .restaurantsData;
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: restaurantDataFromProvider.length,
              itemBuilder: (context, index) {
                final restaurantDataToShow = restaurantDataFromProvider[index];
                return screenWidget(
                  context: context,
                  imageUrl: restaurantDataToShow.imageUrl,
                  name: restaurantDataToShow.name,
                  description: restaurantDataToShow.description,
                  ratings: restaurantDataToShow.ratings,
                  raters: restaurantDataToShow.raters.toInt(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
