import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:initial_task/provider/hotels_provider.dart';
import 'package:initial_task/widgets/screen_widgets.dart';

class HotelsScreen extends ConsumerStatefulWidget {
  const HotelsScreen({super.key});

  @override
  ConsumerState<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends ConsumerState<HotelsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(hotelsProvider).loadHotelsData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final hotelsDataFromProvider = ref.watch(hotelsProvider).hotelsList;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: hotelsDataFromProvider.length,
              itemBuilder: (context, index) {
                final hotelsDataToShow = hotelsDataFromProvider[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:screenWidget(
                    context: context,
                    imageUrl: hotelsDataToShow.imageUrl,
                    name: hotelsDataToShow.hotelName,
                    description: hotelsDataToShow.description,
                    ratings: hotelsDataToShow.ratings,
                    raters: hotelsDataToShow.raters,
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
