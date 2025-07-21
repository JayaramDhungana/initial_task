import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:initial_task/provider/dots_indicator_provider.dart';
import 'package:initial_task/provider/hotels_provider.dart';
import 'package:initial_task/provider/things_to_do_provider.dart';
import 'package:initial_task/screens/hotels_screen.dart';
import 'package:initial_task/screens/restaurant_screens.dart';
import 'package:initial_task/screens/things_to_do_screens.dart';
import 'package:initial_task/widgets/expandable_text_widget.dart';
import 'package:initial_task/widgets/heading_widgets.dart';
import 'package:initial_task/widgets/hotels_data_showing_widgets.dart';
import 'package:initial_task/widgets/over_view_options_widget.dart';
import 'package:initial_task/widgets/thingsToDoWidget.dart';
import 'package:initial_task/widgets/traveller_choice_widgets.dart';

class OverViewScreen extends ConsumerStatefulWidget {
  const OverViewScreen({super.key});

  @override
  ConsumerState<OverViewScreen> createState() => _OverViewScreenState();
}

class _OverViewScreenState extends ConsumerState<OverViewScreen> {
  late final PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(hotelsProvider).loadHotelsData();
      ref.read(thingsTODoProvider).loadThingsToDoList();
    });
    _pageController = PageController();
  }

  List listOfOverViewImages = [
    "assets/overView3.png",
    "assets/overView1.png",
    "assets/overView2.png",
    "assets/overView3.png",
    "assets/overView4.png",
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listofHotelsDataFromProvider = ref.watch(hotelsProvider).hotelsList;
    final listofThingsTodoDataFromProvider = ref
        .watch(thingsTODoProvider)
        .thingsToDoList;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 440,
              child: PageView.builder(
                controller: _pageController,
                itemCount: listOfOverViewImages.length,
                onPageChanged: (index) {
                  ref.read(dotsIndicatorProvider.notifier).changeIndex(index);
                },
                itemBuilder: (context, index) {
                  final imageToShow = listOfOverViewImages[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          height: 400,
                          width: 350,
                          child: Image(
                            image: AssetImage(imageToShow),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            DotsIndicator(
              dotsCount: listOfOverViewImages.length,
              position: ref.watch(dotsIndicatorProvider).newIndex.toDouble(),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
              child: SizedBox(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Pokhara",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge!.copyWith(fontSize: 30),
                        ),
                      ],
                    ),

                    //for ExpandableText Widget
                    ExpandableTextWidget(
                      text:
                          "Pokhara is a beautiful city in Nepal known for its lakes, mountains, and natural beauty. It is a tourist hub and offers activities like paragliding, boating, trekking, and more. The city is also a gateway to the Annapurna mountain range.",
                    ),

                    SizedBox(height: 16),

                    //for Options
                    Column(
                      children: [
                        overViewOptionWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HotelsScreen(),
                              ),
                            );
                          },
                          context: context,
                          text: "Hotels",
                          icon: Icon(Icons.hotel, color: Colors.white),
                        ),

                        overViewOptionWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ThingsToDoScreens(),
                              ),
                            );
                          },
                          context: context,
                          text: "Things to do",
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                        ),
                        overViewOptionWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RestaurantScreens(),
                              ),
                            );
                          },
                          context: context,
                          text: "Restaurants",
                          icon: Icon(Icons.restaurant, color: Colors.white),
                        ),
                        overViewOptionWidget(
                          onTap: () {},
                          context: context,
                          text: "Forums",
                          icon: Icon(Icons.forum, color: Colors.white),
                          isLast: true,
                        ),
                        SizedBox(height: 16),

                        //traveller choice awards
                        travellerChoiceAwards(context: context),
                        SizedBox(height: 16),

                        //For Hotels
                        headingWidgets(
                          context: context,
                          mainTitle: "Hotels",
                          titelDescription:
                              "Top spots to rest up-charming to classic\n to modern",
                        ),
                        SizedBox(
                          height: 350,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listofHotelsDataFromProvider.length,
                            itemBuilder: (context, index) {
                              final hotelsDataToShow =
                                  listofHotelsDataFromProvider[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: hotelsDataShowingWidgets(
                                  hotelName: hotelsDataToShow.hotelName,
                                  imageUrl: hotelsDataToShow.imageUrl,
                                  ratings: hotelsDataToShow.ratings,
                                  raters: hotelsDataToShow.raters,
                                  description: hotelsDataToShow.description,
                                  ref: ref,
                                  index: index,
                                ),
                              );
                            },
                          ),
                        ),
                        headingWidgets(
                          context: context,
                          mainTitle: "Things to do",
                          titelDescription:
                              "Iconic places and can't miss experiences\n that define the city",
                        ),
                        SizedBox(
                          height: 400,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listofThingsTodoDataFromProvider.length,
                            itemBuilder: (context, index) {
                              final thingsTODodataToShow =
                                  listofThingsTodoDataFromProvider[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: thingsToDoWidget(
                                  hotelName: thingsTODodataToShow.name,
                                  imageUrl: thingsTODodataToShow.imageUrl,
                                  ratings: thingsTODodataToShow.ratings,
                                  raters: thingsTODodataToShow.raters,
                                  description: thingsTODodataToShow.description,
                                  ref: ref,
                                  index: index,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 300),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
