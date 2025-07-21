import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:initial_task/provider/things_to_do_provider.dart';
import 'package:initial_task/widgets/screen_widgets.dart';

class ThingsToDoScreens extends ConsumerStatefulWidget {
  const ThingsToDoScreens({super.key});

  @override
  ConsumerState<ThingsToDoScreens> createState() => _ThingsToDoScreensState();
}

class _ThingsToDoScreensState extends ConsumerState<ThingsToDoScreens> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(thingsTODoProvider).loadThingsToDoList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final thingsToDoDataFromProvider = ref
        .watch(thingsTODoProvider)
        .thingsToDoList;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: thingsToDoDataFromProvider.length,
              itemBuilder: (context, index) {
                final thingsToDoItemsToShow = thingsToDoDataFromProvider[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: screenWidget(
                    context: context,
                    imageUrl: thingsToDoItemsToShow.imageUrl,
                    name: thingsToDoItemsToShow.name,
                    description: thingsToDoItemsToShow.description,
                    ratings: thingsToDoItemsToShow.ratings,
                    raters: thingsToDoItemsToShow.raters,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
