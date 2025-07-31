import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:initial_task/bloc/dots_indicator/dots_indicator_bloc.dart';
import 'package:initial_task/bloc/dots_indicator/dots_indicator_event.dart';
import 'package:initial_task/bloc/hotels/hotels_bloc.dart';
import 'package:initial_task/bloc/hotels/hotels_event.dart';
import 'package:initial_task/bloc/hotels/hotels_state.dart';
import 'package:initial_task/bloc/tabbar/tabbar_bloc.dart';
import 'package:initial_task/bloc/tabbar/tabbar_event.dart';
import 'package:initial_task/bloc/things_to_do/things_to_do_bloc.dart';
import 'package:initial_task/bloc/things_to_do/things_to_do_event.dart';
import 'package:initial_task/bloc/things_to_do/things_to_do_state.dart';
import 'package:initial_task/provider/dots_indicator_provider.dart';
import 'package:initial_task/provider/hotels_provider.dart';
import 'package:initial_task/provider/things_to_do_provider.dart';
import 'package:initial_task/screens/home_screen.dart';
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
    context.read<TabbarBloc>().add(ChangeTabIndex(index: 0));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HotelsBloc>().add(LoadHotelsData());
      context.read<ThingsToDoBloc>().add(LoadThingsToDo());
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
    // final listofHotelsDataFromProvider = ref.watch(hotelsProvider).hotelsList;
    // final listofThingsTodoDataFromProvider = ref
    //     .watch(thingsTODoProvider)
    //     .thingsToDoList;
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
                  context.read<DotsIndicatorBloc>().add(
                    ChangeIndex(index: index),
                  );
                  // ref.read(dotsIndicatorProvider.notifier).changeIndex(index);
                },
                itemBuilder: (context, index) {
                  final imageToShow = listOfOverViewImages[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
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
              position: context
                  .watch<DotsIndicatorBloc>()
                  .state
                  .index
                  .toDouble(),
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
                                builder: (context) => HomeScreen(index: 1),
                              ),
                            );
                            context.read<TabbarBloc>().add(
                              ChangeTabIndex(index: 1),
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
                                builder: (context) => HomeScreen(index: 3),
                              ),
                            );
                            context.read<TabbarBloc>().add(
                              ChangeTabIndex(index: 3),
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
                                builder: (context) => HomeScreen(index: 2),
                              ),
                            );
                            context.read<TabbarBloc>().add(
                              ChangeTabIndex(index: 2),
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

                          child: BlocBuilder<HotelsBloc, HotelsState>(
                            builder: (context, state) {
                              if (state is HotelsInitialState) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.hotelsDataList.length,
                                  itemBuilder: (context, index) {
                                    final hotelsDataToShow =
                                        state.hotelsDataList[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: hotelsDataShowingWidgets(
                                        hotelName: hotelsDataToShow.hotelName,
                                        imageUrl: hotelsDataToShow.imageUrl,
                                        ratings: hotelsDataToShow.ratings,
                                        raters: hotelsDataToShow.raters,
                                        description:
                                            hotelsDataToShow.description,
                                        ref: ref,
                                        index: index,
                                        context: context,
                                      ),
                                    );
                                  },
                                );
                              }
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
                          child: BlocBuilder<ThingsToDoBloc, ThingsToDoState>(
                            builder: (context, state) {
                              if (state is ThingsToDoInitialState) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.thingsToDoDataList.length,
                                  itemBuilder: (context, index) {
                                    final thingsTODodataToShow =
                                        state.thingsToDoDataList[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: thingsToDoWidget(
                                        hotelName: thingsTODodataToShow.name,
                                        imageUrl: thingsTODodataToShow.imageUrl,
                                        ratings: thingsTODodataToShow.ratings,
                                        raters: thingsTODodataToShow.raters,
                                        description:
                                            thingsTODodataToShow.description,
                                        ref: ref,
                                        index: index,
                                        context: context,
                                      ),
                                    );
                                  },
                                );
                              }
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
